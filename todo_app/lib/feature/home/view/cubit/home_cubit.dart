

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/feature/home/view/cubit/home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
}
