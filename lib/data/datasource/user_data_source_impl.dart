import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:team1_det_tonryong/data/datasource/user_data_source.dart';
import 'package:team1_det_tonryong/data/dto/user_dto.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<UserDto>> getUsersDto() async {
    final fireBase = FirebaseFirestore.instance;
    final collectionRef = fireBase.collection('user');
    final snapshot = await collectionRef.get();
    final documentSnapshots = snapshot.docs;
    return documentSnapshots.map((e) => UserDto.fromJson(e.data())).toList();
  }

  @override
  Future<bool> creatUser({
    required String uid,
    required String nickNM,
    required String photoURL,
  }) async {
    try {
      final fireBase = FirebaseFirestore.instance;
      final collectionRef = fireBase.collection('user');
      final documentRef = collectionRef.doc();

      Map<String, dynamic> data = {
        "uid": uid,
        "nickNM": nickNM,
        "photoURL": photoURL,
      };
      await documentRef.set(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
