import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team1_det_tonryong/presentation/page/comment/comment_page.dart';
import 'package:team1_det_tonryong/presentation/page/detail/detail_page.dart';
import 'package:team1_det_tonryong/presentation/page/error/error_page.dart';
import 'package:team1_det_tonryong/presentation/page/home/home_page.dart';
import 'package:team1_det_tonryong/presentation/page/login/login_page.dart';
import 'package:team1_det_tonryong/presentation/page/welcome/welcome_page.dart';
import 'package:team1_det_tonryong/presentation/page/write/write_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: navigatorKey,
  errorBuilder: (context, state) {
    return ErrorPage();
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => WelcomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return LoginPage();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return HomePage(
          userNickNM: data['userNickNM'],
          userProfil: data['userProfil'],
        );
      },
      routes: [
        GoRoute(
          path: '/write',
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;
            return WritePage(
              userNM: data['userNickNM'],
            );
          },
        ),
        GoRoute(
          path: '/detail',
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;
            return DetailPage(
              feedPhoto: data['feedPhoto'],
              feedId: data['feedId'],
              feedTime: data['feedTime'],
              writerNM: data['writerNM'],
              fLikeUsers: data['fLikeUsers'],
              userNickNM: data['userNickNM'],
              userProfil: data['userProfil'],
              userId: data['userId'],
              tag: data['tag'],
            );
          },
          routes: [
            GoRoute(
              path: '/comment',
              builder: (context, state) {
                final data = state.extra as Map<String, dynamic>;
                return CommentPage(
                  feedId: data['feedId'],
                  userNM: data['userNM'],
                  userProfil: data['userProfil'],
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
