import 'package:ecommerce_app/features/auth/view/widgets/image_picker/cubit/image_picker_cubit.dart';
import 'package:ecommerce_app/features/auth/view/widgets/image_picker/cubit/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
class ImagePicker extends StatelessWidget {
  const ImagePicker({
    super.key,
    required this.defaultBuilder,
    required this.imageBuilder,
    required this.onImagePicked,
  });

  final Widget defaultBuilder;
  final Widget Function(XFile image) imageBuilder;
  final void Function(XFile image) onImagePicked;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagePickerCubit(),
      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: ImagePickerCubit.get(context).pickImage,
            child: BlocConsumer<ImagePickerCubit, ImagePickerState>(
              listener: (context, state) {
                if (state is ImagePickerPicked) {
                  onImagePicked(state.image);
                }
              },
              builder: (context, state) {
                if (state is ImagePickerPicked) {
                  return imageBuilder(state.image);
                } else {
                  return defaultBuilder;
                }
              },
            ),
          );
        },
      ),
    );
  }
}
