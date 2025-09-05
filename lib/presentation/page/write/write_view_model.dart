import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team1_det_tonryong/presentation/create_feed_provider.dart';

class WriteViewModel extends Notifier<Null> {
  @override
  build() {
    return;
  }

  Future<String> createImage(XFile xFile) async {
    final writeUseCase = ref.read(writeUsecaseProvider);
    return await writeUseCase.creatImage(xFile);
  }

  Future<bool> createFeed({
    required String feedPhoto,
    required String userNM,
  }) async {
    try {
      final writeUseCase = ref.read(writeUsecaseProvider);
      await writeUseCase.createFeed(
        feedPhoto: feedPhoto,
        userNM: userNM,
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

final writeViewModelProvider =
    NotifierProvider<WriteViewModel, Null>(
      () {
        return WriteViewModel();
      },
    );
