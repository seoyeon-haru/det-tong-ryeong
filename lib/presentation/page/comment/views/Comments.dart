import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team1_det_tonryong/domain/entity/comment_entity.dart';
import 'package:team1_det_tonryong/presentation/page/comment/view_model/comment_view_model.dart';
import 'package:team1_det_tonryong/presentation/util/time_ago.dart';

class Comments extends ConsumerStatefulWidget {
  final CommentEntity state;
  final String feedId;
  final String userNM;
  Comments({
    super.key,
    required this.state,
    required this.feedId,
    required this.userNM,
  });

  @override
  ConsumerState<Comments> createState() => _CommentsState();
}

class _CommentsState extends ConsumerState<Comments> {
  late bool isLike;
  late int commentLikeCount;

  @override
  void initState() {
    ref.read(commentViewModelProvider(widget.feedId));
    super.initState();
    _syncLike();
  }

  @override
  void didUpdateWidget(covariant Comments oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state != widget.state) {
      _syncLike();
      setState(() {});
    }
  }

  void _syncLike() {
    commentLikeCount = widget.state.cLikeUsers.length;
    isLike = widget.state.cLikeUsers.contains(widget.userNM);
  }

  void onChangeLike() {
    setState(() {
      if (isLike) {
        commentLikeCount -= 1;
        isLike = false;
      } else {
        commentLikeCount += 1;
        isLike = true;
      }
      ref
          .read(
            commentViewModelProvider(widget.feedId).notifier,
          )
          .fetchUpdateCommentLike(
            commentId: widget.state.commentId,
            feedId: widget.feedId,
            userNM: widget.userNM,
            isLike: isLike,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                widget.state.userProfil,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(widget.state.commentUserNM),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      timeAgo(widget.state.commentTime),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.state.comment,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              onChangeLike();
            },
            child: SizedBox(
              width: 50,
              height: 70,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      isLike
                          ? 'assets/icon/heart_pink.png'
                          : 'assets/icon/heart_brown.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    // TODO: 좋아야 수 k,m으로 표시하기
                    '$commentLikeCount',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
