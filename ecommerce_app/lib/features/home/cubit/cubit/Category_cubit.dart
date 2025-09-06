import 'package:ecommerce_app/features/home/cubit/cubit/Category_state.dart';
import 'package:ecommerce_app/features/home/data/repo_home/Category_repo.dart';
import 'package:ecommerce_app/features/home/data/model/Category_moder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturCubit extends Cubit<FeaturState> {
  FeaturCubit() : super(FeaturInitial());
  static FeaturCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<CategoryModel> categories = [];

  setCurrentIndex(int index) {
    currentIndex = index;
    emit(FeaturSuccess(categories: categories));
  }

  // addFavorite(int categoryId, int productId) {
  //   var category = categories.firstWhere((c) => c.id == categoryId);
  //   var product = category.products!.firstWhere((p) => p.id == productId);

  //   if (product.isFavorite != true) {
  //     product.isFavorite = true;
  //     emit(FeaturSuccess(categories: categories));
  //   }
  // }

  addFavorite(int productId) async {
    HomeRepo homeRepo = HomeRepo();

    var response = await homeRepo.addFavorite(productId);
    response.fold((error) => emit(FeaturError(error: error)), (success) {
      for (var category in categories) {
        for (var product in category.products ?? []) {
          if (product.id == productId) {
            product.isFavorite = true;
            break;
          }
        }
      }
      emit(FeaturSuccess(categories: categories));
    });
  }

  bool isFavorite = false;
  isFavoriteChange() {
    isFavorite = !isFavorite;
  }

  getFeatur() async {
    HomeRepo homeRepo = HomeRepo();
    emit(FeaturLoading());
    var response = await homeRepo.getFeatur();
    response.fold((error) => emit(FeaturError(error: error)), (Featur) {
      categories = Featur;
      emit(FeaturSuccess(categories: Featur));
    });
  }
}
