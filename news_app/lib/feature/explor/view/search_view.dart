import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/core/widgets/list_shimmer.dart';
import 'package:news_app/feature/explor/cubit/cubit/news_cubit.dart';
import 'package:news_app/feature/explor/cubit/cubit/news_state.dart';
import 'package:news_app/feature/explor/view/widgets/explor_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<NewsCubit, NewsState>(
                  builder: (context, state) {
                    final cubit = NewsCubit.get(context);
                    return TextField(
                      controller: cubit.searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        fillColor: AppColors.gray.withValues(alpha: 0.2),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            final value = cubit.searchController.text;
                            if (value.isNotEmpty) {
                              cubit.fetchNews();
                            }
                          },
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          cubit.fetchNews();
                        }
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<NewsCubit, NewsState>(
                  builder: (context, state) {
                    if (state is NewsLoading) {
                      return const ListShimmer();
                    } else if (state is NewsFailure) {
                      return Center(child: Text(state.errorMessage));
                    } else if (state is NewsSuccess) {
                      if (state.articles.articles?.isEmpty ?? true) {
                        return const Center(child: Text('No Data'));
                      }
                      return ListView.builder(
                        padding: AppPaddings.horizontal32vertical8,
                        itemCount: state.articles.articles?.length ?? 0,
                        itemBuilder: (context, index) {
                          return NewsCard(
                            article: state.articles.articles![index],
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
