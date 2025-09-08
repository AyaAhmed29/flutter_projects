import 'package:ecommerce_app/features/home/data/model/Category_moder.dart';

abstract class FeaturState {}

class FeaturInitial extends FeaturState {}

class FeaturLoading extends FeaturState {}

class FeaturError extends FeaturState {
  final String error;
  FeaturError({required this.error});
}

class FavoriteSuccess extends FeaturState {}



class FeaturSuccess extends FeaturState {
  final List<CategoryModel> categories;
  FeaturSuccess({required this.categories});
}
