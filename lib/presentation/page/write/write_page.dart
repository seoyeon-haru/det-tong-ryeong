import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:team1_det_tonryong/presentation/page/write/image_provider.dart';
import 'package:team1_det_tonryong/presentation/page/write/widgets/write_image.dart';
import 'package:team1_det_tonryong/presentation/page/write/write_view_model.dart';

class WritePage extends StatelessWidget {
  String userNM;
  WritePage({required this.userNM});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/icon/appbar_logo.png'),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return GestureDetector(
                onTap: () async {
                  final xFile = ref.read(imageFileProvider);
                  String? imagePath;
                  if (xFile != null) {
                    imagePath = await ref
                        .read(writeViewModelProvider.notifier)
                        .createImage(xFile);
                  }
                  if (imagePath != null) {
                    await ref
                        .read(writeViewModelProvider.notifier)
                        .createFeed(
                          feedPhoto: imagePath,
                          userNM: userNM,
                        );
                    ref.read(imageFileProvider.notifier).state =
                        null;
                    context.pop();
                  } else {
                    CupertinoAlertDialog(
                      title: Text('오류가 발생했습니다'),
                    );
                  }
                },
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/icon/pen2.png'),
                ),
              );
            },
          ),
        ],
      ),
      body: WriteImage(),
    );
  }
}
