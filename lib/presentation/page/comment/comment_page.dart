import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team1_det_tonryong/presentation/page/comment/view_model/comment_view_model.dart';
import 'package:team1_det_tonryong/presentation/page/comment/views/Comments.dart';
import 'package:team1_det_tonryong/presentation/page/comment/views/bottom_write_box.dart';
import 'package:team1_det_tonryong/presentation/page/comment/views/empty_comment.dart';

// TODO : 연결 시 삭제 하고 id를 받아서 사용할 것

class CommentPage extends ConsumerStatefulWidget {
  String feedId;
  String userNM;
  String userProfil;
  CommentPage({
    required this.feedId,
    required this.userNM,
    required this.userProfil,
  });
  @override
  ConsumerState<CommentPage> createState() =>
      _CommentPageState();
}

class _CommentPageState extends ConsumerState<CommentPage> {
  TextEditingController textEditingController =
      TextEditingController();

  void createComment({required String comment}) {
    ref
        .read(commentViewModelProvider(widget.feedId).notifier)
        .fetchCreateComment(
          userProfil: widget.userProfil,
          id: widget.feedId,
          commentUserNM: widget.userNM,
          comment: comment,
        );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(
      commentViewModelProvider(widget.feedId),
    );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(
            Duration(milliseconds: 600),
          );
          ref
              .read(
                commentViewModelProvider(
                  widget.feedId,
                ).notifier,
              )
              .fetchGetComments(
                widget.feedId,
              );
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Image.asset(
              'assets/icon/appbar_logo.png',
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(
                          alpha: 0.2,
                        ),
                        spreadRadius: 1,
                        offset: Offset(0, -2),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 80,
                          height: 2,
                          color: Colors.grey[500],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.center,
                          children: [
                            Transform.translate(
                              offset: Offset(0, -1),
                              child: Text(
                                '댓글',
                                style: TextStyle(
                                  height: 1,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${state.length}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.black,
                      ),
                      state.isEmpty
                          ? EmptyComment()
                          : Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                child: ListView.builder(
                                  itemCount: state.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        index == 0
                                            ? SizedBox(
                                                height: 10,
                                              )
                                            : SizedBox.shrink(),
                                        Comments(
                                          state: state[index],
                                          feedId: widget.feedId,
                                          userNM: widget.userNM,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              BottomWritBox(
                userProfil: widget.userProfil,
                textEditingController: textEditingController,
                createComment: createComment,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
