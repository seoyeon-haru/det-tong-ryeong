import 'package:image_picker/image_picker.dart';

abstract interface class WriteRepository {
  Future<String> createImage(XFile xFile);
  Future<bool> creatFeed({
    required String feedPhoto,
    required String userNM,
  });
}
