import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palitra_app/assets/text_strings.dart';
import 'package:palitra_app/detaled_color_screen.dart';
import 'package:palitra_app/entity/color_entity.dart';
import 'package:palitra_app/main.dart';
import 'package:palitra_app/utils/extensions/string_hex.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<List<ColorEntity>>? _data;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _data = colorsRepository.getColors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: RichText(
            textAlign: TextAlign.center,
            softWrap: true,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(text: AppTexts.appBar1),
                TextSpan(
                  text: AppTexts.appBar2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<ColorEntity>>(
        future: _data,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const _LoadingWidget();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const _ErrorWidget();
            } else if (snapshot.hasData) {
              final data = snapshot.data;
              return data != null
                  ? _ContentWidget(data: data)
                  : const _EmptyWidget();
            }
          }
          return const SizedBox(); // Добавим пустой виджет для остальных состояний
        },
      ),
    );
  }
}

// Виджет с основным контентом (Color gridview).
class _ContentWidget extends StatelessWidget {
  final List<ColorEntity> data;
  const _ContentWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.74,
          mainAxisSpacing: 40,
          crossAxisSpacing: 22),
      itemCount: data.length,
      itemBuilder: (_, i) => _ColorWidget(
        colorData: data[i],
      ),
    );
  }
}

// Ячейка с цветом
class _ColorWidget extends StatelessWidget {
  final ColorEntity colorData;

  const _ColorWidget({required this.colorData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Center(
      child: GestureDetector(
        onTap: () => onTap(context),
        onLongPress: onLongPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(
              dimension: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: colorData.value.hexToColor(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(colorData.name, style: theme.bodySmall),
            Text(colorData.value, style: theme.bodySmall),
          ],
        ),
      ),
    );
  }

  void onTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => DetailedColorScreen(colorData: colorData)));
  }

  void onLongPress() async {
    await Clipboard.setData(ClipboardData(text: colorData.value));
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
      child: Text(AppTexts.error),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppTexts.empty),
    );
  }
}
