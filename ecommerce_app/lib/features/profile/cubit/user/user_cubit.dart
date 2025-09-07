import 'package:ecommerce_app/features/auth/data/model/user_model.dart';
import 'package:ecommerce_app/features/profile/cubit/user/user_state.dart';
import 'package:ecommerce_app/features/profile/data/model/repo/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  var usernameController = TextEditingController();
  var pohoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  XFile? image;
  UserModel? _cachedUser;

  void controlUser(UserModel? user) {
    _cachedUser = user;
    if (user != null) {
      usernameController.text = user.name ?? '';
      pohoneController.text = user.phone ?? '';
      emit(UserSuccess(user: user)); // Emit UserSuccess with the provided user
    } else {
      getUser();
    }
  }

  getUser() async {
    if (_cachedUser != null) {
      emit(UserSuccess(user: _cachedUser!));
      return;
    }

    emit(UserLoading());
    UserRepo userRepo = UserRepo();
    var response = await userRepo.getUser();

    response.fold((error) => emit(UserFailure(error: error)), (user) {
      usernameController.text = user.name!;
      pohoneController.text = user.phone!;
      _cachedUser = user;
      emit(UserSuccess(user: user));
    });
  }

  updateUser(String name, String phone, XFile? image) async {
    emit(UserLoading());
    UserRepo userRepo = UserRepo();
    var response = await userRepo.updateUser(name, image, phone);

    response.fold((error) => emit(UserFailure(error: error)), (_) {
      _cachedUser = UserModel(
        name: name,
        phone: phone,
        imagePath: image?.path ?? _cachedUser?.imagePath,
      );
      emit(UpdateUserSuccess());
    });
  }

  onPreasedSave() {
    if (formKey.currentState!.validate()) {
      updateUser(usernameController.text, pohoneController.text, image);
    }
  }
}
