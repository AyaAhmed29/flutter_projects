import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/feature/explor/cubit/cubit/news_cubit.dart';
import 'package:news_app/feature/explor/cubit/cubit/news_state.dart';
import 'package:news_app/feature/explor/view/widgets/explor_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..fetchNews(),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: NewsCubit.get(context).searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        fillColor: AppColors.gray.withValues(alpha: 0.2),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),

                        prefixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            final value = NewsCubit.get(
                              context,
                            ).searchController.text;
                            if (value.isNotEmpty &&
                                value !=
                                    NewsCubit.get(
                                      context,
                                    ).searchController.text) {
                              NewsCubit.get(context).searchController.text =
                                  value;
                              NewsCubit.get(context).fetchNews();
                            }
                          },
                        ),
                      ),
                      onSubmitted: (value) {
                        if (value.isNotEmpty &&
                            value !=
                                NewsCubit.get(context).searchController.text) {
                          NewsCubit.get(context).searchController.text = value;
                          NewsCubit.get(context).fetchNews();
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<NewsCubit, NewsState>(
                      builder: (context, state) {
                        if (state is NewsLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is NewsFailure) {
                          return Center(child: Text(state.errorMessage));
                        } else if (state is NewsSuccess) {
                          if (state.articles.articles?.isEmpty ?? true) {
                            return Center(child: Text('No Data'));
                          }
                          return ListView.builder(
                            padding: AppPaddings.horizontal32vertical8,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return NewsCard(
                                article: state.articles.articles?[index],
                              );
                            },
                            itemCount: state.articles.articles?.length ?? 10,
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
