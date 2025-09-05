import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team1_det_tonryong/presentation/page/detail/view_model/detail_view_model.dart';

// 좋아요 버튼 활성화 및 댓글 페이지 연결 예정
class LikeComment extends ConsumerWidget {
  final String feedId;
  final String userNickNM;
  final String userProfil;
  final String userId;
  const LikeComment({
    super.key,
    required this.feedId,
    required this.userNickNM,
    required this.userProfil,
    required this.userId,
  });

  //현재 유저 UserNM
  // 파이어베이스 블로그 앱 복습, todo 앱 만들기
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailViewModelProvider(feedId));
    final viewmodel = ref.read(
      detailViewModelProvider(feedId).notifier,
    );
    bool like = false;
    for (var i = 0; i < (state.feed?.fLikeUsers.length ?? 0); i++) {
      if (userNickNM == state.feed!.fLikeUsers[i]) {
        like = true;
        break;
      }
    }
    int likeCount = state.feed?.fLikeUsers.length ?? 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            viewmodel.feedLikeUpdate(
              liked: !like,
              userNM: userNickNM,
            );
          }, // 다른 곳에서 좋아요 누르면 올라간 숫자 유지 // 좋아요 누르면 숫자 올라가게 만들기
          child: Image.asset(
            like ? 'assets/icon/heart_pink.png' : 'assets/icon/heart_brown.png',
            width: 40,
            height: 40,
          ),
        ),
        Text('$likeCount'),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            context.push(
              '/home/detail/comment',
              extra: {
                'feedId': feedId,
                'userNM': userNickNM,
                'userProfil': userProfil,
              },
            );
          },
          child: Image.asset(
            'assets/icon/dg.png',
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }
}
// 좋아요와 유지되지 않고 삭제가 실시간 반영이 안됨 