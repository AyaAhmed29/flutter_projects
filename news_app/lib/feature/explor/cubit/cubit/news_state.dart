
import 'package:news_app/feature/explor/data/model/articles_model.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final ArticlesResponseModel articles;
  NewsSuccess(this.articles);

}

final class NewsFailure extends NewsState {
  final String errorMessage;
  NewsFailure(this.errorMessage);
}
