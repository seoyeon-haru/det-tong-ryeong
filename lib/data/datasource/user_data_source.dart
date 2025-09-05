import 'package:team1_det_tonryong/data/dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<List<UserDto>?> getUsersDto();
  Future<bool> creatUser({
    required String uid,
    required String nickNM,
    required String photoURL,
  });
}
