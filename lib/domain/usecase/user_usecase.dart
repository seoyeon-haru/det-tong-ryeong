import 'package:team1_det_tonryong/domain/entity/user.dart';
import 'package:team1_det_tonryong/domain/repository/user_repository.dart';

class UserUsecase {
  UserUsecase(this._userRepository);
  final UserRepository _userRepository;

  Future<List<UserEntity>> executegetUsers() async {
    return await _userRepository.getUsersEntity();
  }

  Future<bool> executeCreatUser({
    required String uid,
    required String nickNM,
    required String photoURL,
  }) async {
    return await _userRepository.creatUser(
      uid: uid,
      nickNM: nickNM,
      photoURL: photoURL,
    );
  }
}
