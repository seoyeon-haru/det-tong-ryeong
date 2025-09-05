import 'package:team1_det_tonryong/domain/entity/user.dart';

abstract interface class UserRepository {
  Future<List<UserEntity>> getUsersEntity();
  Future<bool> creatUser({
    required String uid,
    required String nickNM,
    required String photoURL,
  });
}
