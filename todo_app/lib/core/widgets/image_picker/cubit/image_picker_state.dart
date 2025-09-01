import 'package:image_picker/image_picker.dart';

sealed class ImagePickerState {}

final class ImagePickerInitial extends ImagePickerState {}

class ImagePickerPicked extends ImagePickerState {
  final XFile image;
  ImagePickerPicked(this.image);
}
