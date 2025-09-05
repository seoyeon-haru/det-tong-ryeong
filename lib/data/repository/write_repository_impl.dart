import 'package:image_picker/image_picker.dart';
import 'package:team1_det_tonryong/data/datasource/write_data_source.dart';
import 'package:team1_det_tonryong/domain/repository/write_repository.dart';

class WriteRepositoryImpl implements WriteRepository {
  final WriteDataSource _dataSource;
  WriteRepositoryImpl(this._dataSource);

  @override
  Future<String> createImage(XFile xFile) async {
    return await _dataSource.createImage(xFile);
  }

  @override
  Future<bool> creatFeed({
    required String feedPhoto,
    required String userNM,
  }) async {
    return await _dataSource.createFeed(
      feedPhoto: feedPhoto,
      userNM: userNM,
    );
  }
}
