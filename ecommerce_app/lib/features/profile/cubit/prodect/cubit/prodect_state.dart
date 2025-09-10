part of 'prodect_cubit.dart';

@immutable
sealed class ProdectState {}

final class ProdectInitial extends ProdectState {}

final class ProdectLoading extends ProdectState {}

final class ProdectSuccess extends ProdectState {
  final List<ProductModel> productModel;

  ProdectSuccess(this.productModel);
}

final class ProdectFailure extends ProdectState {
  final String error;

  ProdectFailure(this.error);
}
