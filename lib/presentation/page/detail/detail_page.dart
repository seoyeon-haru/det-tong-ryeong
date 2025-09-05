import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team1_det_tonryong/presentation/page/detail/view_model/detail_view_model.dart';
import 'package:team1_det_tonryong/presentation/page/detail/widget/delete_button.dart';
import 'package:team1_det_tonryong/presentation/page/detail/widget/floating_comment.dart';
import 'package:team1_det_tonryong/presentation/page/detail/widget/like_comment.dart';

class DetailPage extends ConsumerWidget {
  final String feedPhoto;
  final String feedId;
  final DateTime feedTime;
  final String writerNM;
  final List<String> fLikeUsers;
  final String userNickNM;
  final String userProfil;
  final String userId;
  final String tag;
  DetailPage({
    super.key,
    required this.feedPhoto,
    required this.feedId,
    required this.feedTime,
    required this.writerNM,
    required this.fLikeUsers,
    required this.userNickNM,
    required this.userProfil,
    required this.userId,
    required this.tag,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      detailViewModelProvider(feedId),
    );
    final String bestComment = state.bestComments.isEmpty
        ? ''
        : state.bestComments[0].comment;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/icon/appbar_logo.png'),
        centerTitle: true,
        actions: [
          DeleteButton(
            feedId: feedId,
            key: key,
            userNM: userNickNM,
            writerNM: writerNM,
            onDelete: () {
              Text('삭제됨'); // 작성자만 보이게 만들기

              Navigator.pop(context); // 삭제하고 홈페이지로 이동 구현하기
            },
          ),
        ],
      ),

      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  writerNM, // 임시 사용자 이름
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  feedTime.toString().split(' ')[0],
                ), // 날짜만 나오고 시간 빼기
              ],
            ),
          ),
          Hero(
            tag: tag,
            child: Image.network(
              feedPhoto,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ), // 임시이미지
          SizedBox(height: 5),
          Text(
            bestComment, // 배스트 댓글
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            width: 400,
            height: 300,
            color: Colors.white,
            child: Stack(
              children: [
                FloatingCommentManager(
                  state: state.bestComments,
                ), // 댓글 표시
                Positioned(
                  //하트, 댓글 아이콘 위치
                  right: 10,
                  top: 100,
                  child: LikeComment(
                    feedId: feedId,
                    userNickNM: userNickNM,
                    userProfil: userProfil,
                    userId: userId,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
