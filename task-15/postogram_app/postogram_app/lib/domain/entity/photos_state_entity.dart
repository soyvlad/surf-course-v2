import 'package:postogram_app/domain/entity/photo_entity.dart';

class PhotosStateEntity {
  final int indexInitPhoto;
  final List<PhotoEntity> photos;
  const PhotosStateEntity({required this.indexInitPhoto, required this.photos});
}
