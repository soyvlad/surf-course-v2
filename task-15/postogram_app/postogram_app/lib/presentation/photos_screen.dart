import 'dart:async';
import 'package:flutter/material.dart';

import 'package:postogram_app/assets/app_images.dart';
import 'package:postogram_app/assets/app_texts.dart';
import 'package:postogram_app/assets/constants.dart';
import 'package:postogram_app/domain/entity/photo_entity.dart';
import 'package:postogram_app/domain/entity/photos_state_entity.dart';
import 'package:postogram_app/main.dart';
import 'package:postogram_app/presentation/detailed_screen.dart';
import 'package:union_state/union_state.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  final screenState = UnionStateNotifier<List<PhotoEntity>>.loading();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final data = await photosRepository.getPhotos();
      screenState.content(data);
    } on Exception catch (e) {
      screenState.failure(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImages.logo2),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
      ),
      body: UnionStateListenableBuilder<List<PhotoEntity>>(
        unionStateListenable: screenState,
        loadingBuilder: (_, __) => const _LoadingWidget(),
        builder: (_, listOfPhotos) => listOfPhotos.isNotEmpty
            ? _ContentWidget(data: listOfPhotos)
            : const _EmptyWidget(),
        failureBuilder: (_, __, ___) => const _ErrorWidget(),
      ),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  final List<PhotoEntity> data;
  const _ContentWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding - 4, horizontal: kDefaultPadding / 2),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 3,
          mainAxisSpacing: 5),
      itemCount: data.length,
      itemBuilder: (_, i) =>
          _PhotoWidget(indexSelectedPhoto: i, photosList: data),
    );
  }
}

class _PhotoWidget extends StatelessWidget {
  final int indexSelectedPhoto;
  final List<PhotoEntity> photosList;

  const _PhotoWidget({
    required this.indexSelectedPhoto,
    required this.photosList,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = photosList[indexSelectedPhoto].imageUrl;

    return Center(
      child: GestureDetector(
        onTap: () => _onTap(context, indexInitPhoto: indexSelectedPhoto),
        child: AspectRatio(
          aspectRatio: 1,
          child: Hero(
            tag: imageUrl,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null),
                );
              },
              errorBuilder: (_, error, stackTrace) => const Center(
                child: Text(AppTexts.errorScreen),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, {required int indexInitPhoto}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetailedScreen(
          initState: PhotosStateEntity(
              indexInitPhoto: indexInitPhoto, photos: photosList),
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppTexts.errorScreen),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppTexts.emptyScreen),
    );
  }
}
