import 'package:ecommerce_app/features/auth/view/widgets/image_picker/cubit/image_picker_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitial());
static ImagePickerCubit get(context) => BlocProvider.of(context);
  pickImage() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(ImagePickerPicked(image));
    }
  }
}
