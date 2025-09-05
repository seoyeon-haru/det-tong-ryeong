import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team1_det_tonryong/domain/entity/user.dart';
import 'package:team1_det_tonryong/presentation/user_provider.dart';

class UserViewModel extends Notifier<List<UserEntity>> {
  @override
  List<UserEntity> build() {
    getUsers();
    return [];
  }

  Future<void> getUsers() async {
    final userUsecase = ref.read(userUsecaseProvider);
    final result = await userUsecase.executegetUsers();
    state = result;
  }

  Future<bool> createUser({
    required String uid,
    required String nickNM,
    required String photoURL,
  }) async {
    try {
      final userUsecase = ref.read(userUsecaseProvider);
      await userUsecase.executeCreatUser(
        uid: uid,
        nickNM: nickNM,
        photoURL: photoURL,
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

final userViewModelProvider = NotifierProvider<UserViewModel, List<UserEntity>>(
  () {
    return UserViewModel();
  },
);
