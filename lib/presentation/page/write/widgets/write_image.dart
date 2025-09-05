import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team1_det_tonryong/presentation/page/write/image_provider.dart';

class WriteImage extends ConsumerWidget {
  const WriteImage({super.key});

  Future<void> _pickImage(WidgetRef ref) async {
    final picker = ImagePicker();
    ref.read(imageFileProvider.notifier).state = await picker
        .pickImage(
          source: ImageSource.gallery,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(imageFileProvider);

    final file = (image == null) ? null : File(image.path);

    return Container(
      padding: EdgeInsets.all(30),
      child: Align(
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: () async {
            _pickImage(ref);
          },
          child: Container(
            height: 300,
            width: double.infinity,
            child: file == null
                ? Image.asset('assets/icon/image_pick.png')
                : Image.file(file),
          ),
        ),
      ),
    );
  }
}
