import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:team1_det_tonryong/domain/entity/home_entity.dart';
import 'package:team1_det_tonryong/presentation/page/detail/detail_page.dart';
import 'package:team1_det_tonryong/router.dart';

class NotificationHelper {
  static final flutterNotificationPlugin =
      FlutterLocalNotificationsPlugin();
  static Future<void> init() async {
    //  안드로이드 초기화 설정
    final androidSetting = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    // ios 초기화 설정
    final darwinSetting = DarwinInitializationSettings(
      // 알림 권한
      requestAlertPermission: true,
      // 뱃지 권한
      requestBadgePermission: true,
      // 사운드 권한
      requestSoundPermission: true,
    );
    final initSetting = InitializationSettings(
      android: androidSetting,
      iOS: darwinSetting,
    );

    await flutterNotificationPlugin.initialize(
      initSetting,
      // 포그라운드 (앱이 열려있을 때) 푸시알림 터치했을 때 실행되는 함수
      onDidReceiveNotificationResponse: (details) {
        print('넘어온 페이로드 :${details.payload}');
        final feedMap = jsonDecode(details.payload!);
        //TODO go_router로 변경
        Navigator.push(
          navigatorKey.currentState!.context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(
                feedPhoto: feedMap['feedPhoto'],
                feedId: feedMap['feedId'],
                feedTime: DateTime.parse(feedMap['feedTime']),
                writerNM: feedMap['userNM'],
                fLikeUsers: List.from(feedMap['fLikeUsers']),
                userNickNM: feedMap['userNM'],
                userId: '',
                userProfil: '',
                tag: '',
              );
            },
          ),
        );
        // context.push(
        //   '/home/detail',
        //   navigatorKey.currentState!.context,
        //   extra: {
        //     'feedPhoto': feed.feedPhoto,
        //     'feedId': feed.feedId,
        //     'feedTime': feed.feedTime,
        //     'writerNM': feed.userNM,
        //     'fLikeUsers': feed.fLikeUsers,
        //     'userNickNM': widget.userNickNM,
        //     'userProfil': widget.userProfil,
        //     'userId': feed.feedId,
        //     'tag': feed.feedPhoto,
        //   },
        // );
      },
    );
    final androidPlugin = flutterNotificationPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await androidPlugin?.requestNotificationsPermission();
  }

  static Future<void> show({
    required String title,
    required String content,
    required HomeEntity feed,
  }) async {
    // 실제로 푸시 알림 보내는 기능 구현
    flutterNotificationPlugin.show(
      // 알림 ID => 중복된 알림 관리하기 위한 고유 ID
      0,
      title,
      content,
      NotificationDetails(
        // 상세 정보 넣을 수 있음
        android: AndroidNotificationDetails(
          // 안드로이드 8.0 이상에서 알림을 그룹화하는데 사용되는 ID
          '댓통령',
          // 설정에서 보여지는 알림 채널 이름
          '댓통령',
          // 알림에 우선 순위를 결정함
          importance: Importance.high,
          // 알림 울렸을 때 소리 나도록 설정
          playSound: true,
        ),
        iOS: DarwinNotificationDetails(
          // 알림 소리 재생 여부
          presentSound: true,
          // 알림 표시 여부
          presentAlert: true,
          // 배지 표시 여부
          presentBadge: true,
        ),
      ),

      /// 사용자가 알림 터치했을 때 payload 값이 백그라운드 함수나 위에서 설정한
      /// onDidReceiveNotificationResponse
      ///  함수에 details 부분에 담겨서 넘어오게 됨
      // 알림에 부가적인 데이터 담는 용도
      payload: jsonEncode({
        'feedId': feed.feedId,
        'feedPhoto': feed.feedPhoto,
        'fLikeUsers': feed.fLikeUsers,
        'feedTime': feed.feedTime.toIso8601String(),
        'userNM': feed.userNM,
      }),
    );
  }
}
