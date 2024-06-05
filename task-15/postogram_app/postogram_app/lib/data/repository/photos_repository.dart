import 'package:postogram_app/data/mock_data.dart';
import 'package:postogram_app/domain/entity/photo_entity.dart';

class PhotosRepository {
  Future<List<PhotoEntity>> getPhotos() async {
    return Future.value(mockData);
  }
}
