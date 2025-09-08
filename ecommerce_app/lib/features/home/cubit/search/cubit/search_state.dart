
import 'package:ecommerce_app/features/home/data/model/prodect_model.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchSuccess extends SearchState {
  final ProductsModel products;
  SearchSuccess({required this.products});


}
final class SearchFailure extends SearchState {
  final String error;
  SearchFailure({required this.error});
}

