import 'package:team1_det_tonryong/data/datasource/user_data_source.dart';
import 'package:team1_det_tonryong/domain/entity/user.dart';
import 'package:team1_det_tonryong/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userDataSource);
  final UserDataSource _userDataSource;

  @override
  Future<List<UserEntity>> getUsersEntity() async {
    final result = await _userDataSource.getUsersDto();
    if (result != null) {
      return result
          .map((e) => UserEntity(nickNM: e.nickNM, uid: e.uid))
          .toList();
    }
    return [];
  }

  @override
  Future<bool> creatUser({
    required String uid,
    required String nickNM,
    required String photoURL,
  }) async {
    return await _userDataSource.creatUser(
      uid: uid,
      nickNM: nickNM,
      photoURL: photoURL,
    );
  }
}
