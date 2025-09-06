import 'package:ecommerce_app/features/auth/data/model/user_model.dart';
import 'package:ecommerce_app/features/home/cubit/cubit/user_state.dart';
import 'package:ecommerce_app/features/home/data/repo_home/Category_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserCubit extends Cubit<UserState>
{
  UserCubit(): super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  void controlUser(UserModel? user)
  {
    if(user == null)
    {
      getUser();
    }
    else
    {
      emit(UserSuccess(user: user));
    }
  }
  getUser()async
  {
    HomeRepo homeRepo = HomeRepo();
    emit(UserLoading());
    var response = await homeRepo.getUser();
    response.fold(
      (error)=> emit(UserError(error: error)),
      (user) => emit(UserSuccess(user: user)));
  }

}