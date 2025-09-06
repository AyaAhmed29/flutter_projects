part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final ArticlesResponseModel articles;
  HomeSuccess(this.articles);
}

final class HomeFailure extends HomeState {
  final String errorMessage;
  HomeFailure(this.errorMessage);
}
