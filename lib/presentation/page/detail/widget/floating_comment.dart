import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team1_det_tonryong/domain/entity/detail_entity.dart';

// 랜덤위치 댓글 기능
class FloatingCommentManager extends ConsumerStatefulWidget {
  final List<DetailEntity> state; // 디테일 페이지에서 넘겨준 것을 UI에 뿌려준다 중요
  const FloatingCommentManager({super.key, required this.state});

  @override
  ConsumerState<FloatingCommentManager> createState() =>
      _FloatingCommentManagerState();
}

class _FloatingCommentManagerState
    extends ConsumerState<FloatingCommentManager> {
  // 현재 화면에 댓글리스트 표시
  final List<_FloatingComment> activeComments = [];
  final Random random = Random(); // 랜덤 표시
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCommentSpawner();
  }

  void _startCommentSpawner() {
    _timer = Timer.periodic(const Duration(seconds: 2), (
      timer,
    ) {
      List<String> displayComments = [];
      if (widget.state.length == 1) {
        displayComments = [];
      } else if (widget.state.length == 2) {
        displayComments = [widget.state[1].comment];
      } else if (widget.state.length == 3) {
        displayComments = [
          widget.state[1].comment,
          widget.state[2].comment,
        ];
      } else if (widget.state.length > 3) {
        displayComments = [
          widget.state[1].comment,
          widget.state[2].comment,
          widget.state[3].comment,
        ];
      }

      //2초마다 댓글생성
      if (!mounted) return;

      //화면 밖에 안빠져 나가게 하기
      final screenWidth = MediaQuery.of(context).size.width;

      final randomX = random.nextDouble() * (screenWidth * 0.5); // 공범
      final randomY = random.nextDouble() * (250.0); // 여기가 범인

      if (displayComments.isNotEmpty) {
        setState(() {
          // print('Qnd');
          activeComments.add(
            _FloatingComment(
              text:
                  displayComments[random.nextInt(
                    displayComments.length,
                  )],
              startX: randomX,
              startY: randomY,
              key: UniqueKey(), //중복 방지
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state.isEmpty) {
      // 댓글 없으면 애니메이션 없이 고정 텍스트 출력
      return Container(
        width: double.infinity,
        height: 300,
        color: Colors.white,
        alignment: Alignment.center,
        child: const Text(
          '제목의 왕 자리에 도전해보세요!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F1F1F),
          ),
        ),
      );
    }

    return Stack(
      // 댓글리스트를 스택으로 만들기
      children: activeComments,
    );
  }
}

class _FloatingComment extends StatefulWidget {
  final String text;
  final double startX;
  final double startY;

  const _FloatingComment({
    required this.text,
    required this.startX,
    required this.startY,
    super.key,
  });

  @override
  State<_FloatingComment> createState() => _FloatingCommentState();
}

class _FloatingCommentState extends State<_FloatingComment>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _positionY;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), //3초동안 애니메이션
    )..forward();

    //투명도
    _opacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
    _positionY = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (mounted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              final parentState = context
                  .findAncestorStateOfType<_FloatingCommentManagerState>();
              parentState?.setState(() {
                parentState.activeComments.remove(widget);
              });
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    const int maxTextLine = 15;
    final text = widget.text;
    final displayText = (text.length > maxTextLine)
        ? '${text.substring(0, maxTextLine)}\n${text.substring(maxTextLine)}'
        : text;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Positioned(
          left: widget.startX.clamp(0, screenWidth),
          bottom: widget.startY + _positionY.value,
          child: Opacity(
            opacity: _opacity.value,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 10,
                maxWidth: 400,
                minHeight: 10,
                maxHeight: 200,
              ),
              child: Text(
                displayText, //예시 택스트 가져오기
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        );
      },
    );
  }
}
