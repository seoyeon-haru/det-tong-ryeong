// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

void main() {
  DateTime test = DateTime(2025, 8, 02, 12, 14);
  print(timeAgo(test));
}

String timeAgo(DateTime date) {
  final diff = DateTime.now().difference(date);

  if (diff.inSeconds < 60) {
    return '방금 전';
  } else if (diff.inMinutes < 60) {
    return '${diff.inMinutes}분 전';
  } else if (diff.inHours < 24) {
    return '${diff.inHours}시간 전';
  } else if (diff.inDays < 30) {
    return '${diff.inDays}일 전';
  } else if (diff.inDays < 365) {
    return '${diff.inDays ~/ 30}개월 전';
  } else {
    return '${diff.inDays ~/ 365}년 전';
  }
}
