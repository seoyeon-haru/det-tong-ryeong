import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team1_det_tonryong/data/datasource/user_data_source.dart';
import 'package:team1_det_tonryong/data/datasource/user_data_source_impl.dart';
import 'package:team1_det_tonryong/data/repository/user_repository_impl.dart';
import 'package:team1_det_tonryong/domain/repository/user_repository.dart';
import 'package:team1_det_tonryong/domain/usecase/user_usecase.dart';

final _userDataSourceProvider = Provider<UserDataSource>(
  (ref) {
    return UserDataSourceImpl();
  },
);

final _userRepositoryProvider = Provider<UserRepository>(
  (ref) {
    return UserRepositoryImpl(
      ref.read(_userDataSourceProvider),
    );
  },
);

final userUsecaseProvider = Provider(
  (ref) {
    return UserUsecase(ref.read(_userRepositoryProvider));
  },
);
