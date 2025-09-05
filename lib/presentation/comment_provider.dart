import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team1_det_tonryong/data/datasource/comment_data_source.dart';
import 'package:team1_det_tonryong/data/datasource/comment_data_source_impl.dart';
import 'package:team1_det_tonryong/data/repository/comment_repository_impl.dart';
import 'package:team1_det_tonryong/domain/repository/comment_repository.dart';
import 'package:team1_det_tonryong/domain/usecase/comment_usecase.dart';

final _commentDataSourceProvider = Provider<CommentDataSource>(
  (ref) {
    return CommentDataSourceImpl();
  },
);

final _commentRepositoryProvider = Provider<CommentRepository>(
  (ref) {
    return CommentRepositoryImpl(
      ref.read(_commentDataSourceProvider),
    );
  },
);

final commentUsecaseProvider = Provider(
  (ref) {
    return CommentUsecase(ref.read(_commentRepositoryProvider));
  },
);
