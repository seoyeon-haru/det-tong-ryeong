import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// 게시물 삭제 하기
class DeleteButton extends ConsumerWidget {
  final VoidCallback onDelete;
  final String feedId;
  final String userNM;
  final String writerNM;

  const DeleteButton({
    super.key,
    required this.onDelete,
    required this.feedId,
    required this.userNM,
    required this.writerNM,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //사용자 UserNM 가져오기

    //작성자만 삭제 버튼 보이게
    if (writerNM != userNM) return SizedBox.shrink();
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('게시물 삭제'),
            content: const Text('왕이 없습니다. \n정말 삭제하시겠습니까?'),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('취소'),
              ),

              TextButton(
                onPressed: () {
                  context.pop();
                  context.pop(true);
                },
                child: const Text('삭제'),
              ),
            ],
          ),
        );
      },
      child: Image.asset(
        'assets/icon/trash.png',
        width: 50,
        height: 50,
      ),
    );
  }
}
// 닉네임이 같아도 삭제버튼이 안나옴