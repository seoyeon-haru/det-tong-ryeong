import 'package:image_picker/image_picker.dart';
import 'package:team1_det_tonryong/domain/repository/write_repository.dart';

class WriteUsercase {
  final WriteRepository repository;
  WriteUsercase(this.repository);

  Future<String> creatImage(XFile xFile) {
    return repository.createImage(xFile);
  }

  Future<bool> createFeed({
    required String feedPhoto,
    required String userNM,
  }) async {
    return await repository.creatFeed(
      feedPhoto: feedPhoto,
      userNM: userNM,
    );
  }
}
