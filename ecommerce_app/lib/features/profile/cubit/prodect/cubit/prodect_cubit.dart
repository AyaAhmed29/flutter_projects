import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/home/data/model/Category_moder.dart';
import 'package:ecommerce_app/features/profile/data/model/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'prodect_state.dart';

class ProdectCubit extends Cubit<ProdectState> {
  ProdectCubit() : super(ProdectInitial());
  static ProdectCubit get(context) => BlocProvider.of(context);
  Future<void> getFavoriteProducts() async {
    emit(ProdectLoading());

    try {
      var response = await ProfileRepo().getFavoriteProducts();
      response.fold(
        (l) => emit(ProdectFailure(l)),
        (r) => emit(ProdectSuccess(r)),
      );
    } catch (e) {
      emit(ProdectFailure(e.toString()));
    }
  }
}
