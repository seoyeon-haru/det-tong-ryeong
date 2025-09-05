import 'package:image_picker/image_picker.dart';

abstract interface class WriteDataSource {
  Future<String> createImage(XFile xFile);
  Future<bool> createFeed({
    required String feedPhoto,
    required String userNM,
  });
}
