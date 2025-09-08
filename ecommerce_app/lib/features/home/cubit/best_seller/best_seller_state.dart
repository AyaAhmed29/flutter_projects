part of 'best_seller_cubit.dart';

@immutable
sealed class BestSellerState {}

final class BestSellerInitial extends BestSellerState {}

class BestSellerLoading extends BestSellerState {}

class BestSellerfailure extends BestSellerState {
  final String error;
  BestSellerfailure({required this.error});
}

class FavoriteSuccess extends BestSellerState {}

class BestSellerSuccess extends BestSellerState {
  final BestSellerModel bestSellerProducts;
  BestSellerSuccess({required this.bestSellerProducts});
}
