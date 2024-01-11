import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_fave_app/widgets/widget.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class TakePhotoPage extends HookConsumerWidget {
  const TakePhotoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final singleFilePath = useState<XFile?>(null);

    useEffect(
      () {
        if (singleFilePath.value != null) {
          Future.delayed(const Duration(seconds: 1), () {
            context.pop(singleFilePath.value);
          });
        }
        return null;
      },
      [singleFilePath.value],
    );

    return Scaffold(
      appBar: const CommonAppBar(),
      body: CameraAwesomeBuilder.awesome(
        progressIndicator: const Loading(),
        saveConfig: SaveConfig.photo(
          pathBuilder: (sensors) async {
            final extDir = await getTemporaryDirectory();
            final testDir = await Directory(
              '${extDir.path}/camerawesome',
            ).create(recursive: true);
            if (sensors.length == 1) {
              final filePath =
                  '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
              return SingleCaptureRequest(filePath, sensors.first).when(
                single: (single) {
                  singleFilePath.value = single.file;
                  return single;
                },
              );
            } else {
              return MultipleCaptureRequest(
                {
                  for (final sensor in sensors)
                    sensor:
                        '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
                },
              );
            }
          },
          exifPreferences: ExifPreferences(saveGPSLocation: true),
        ),
        onMediaTap: (mediaCapture) {
          mediaCapture.captureRequest.when(
            single: (single) {
              debugPrint('single: ${single.file?.path}');
              OpenFile.open(single.file?.path);
            },
          );
        },
      ),
    );
  }
}
