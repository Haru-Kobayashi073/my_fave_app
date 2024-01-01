import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_modification_status.g.dart';

enum ImageStatus {
  none,
  picked,
  cropped,
  uploaded,
}

@Riverpod(keepAlive: true)
class ImageModificationStatus extends _$ImageModificationStatus {
  @override
  ImageStatus build() {
    return ImageStatus.none;
  }

  void reset() {
    state = ImageStatus.none;
  }

  void picked() {
    state = ImageStatus.picked;
  }

  void cropped() {
    state = ImageStatus.cropped;
  }

  void uploaded() {
    state = ImageStatus.uploaded;
  }
}
