import 'package:flutter/material.dart';

class EmptyComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          SizedBox(
            height: 150,
          ),
          Image.asset(
            'assets/icon/empty_logo.png',
            width: 200,
            height: 100,
          ),

          Text(
            '제목이 없습니다.\n제목을 지어주세요!',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xffE9DDD9),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
