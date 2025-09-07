import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/core/widgets/List_shimmer.dart';
import 'package:news_app/core/widgets/custom_app_bar.dart';
import 'package:news_app/feature/home/view/cubit/cubit/home_cubit.dart';
import 'package:news_app/feature/home/view/widgets/article_card_item.dart';
import 'package:news_app/feature/home/view/widgets/most_popular_item.dart';
import 'package:news_app/feature/weather/data/cubit/cubit/weather_cubit.dart';
import 'package:news_app/feature/weather/data/cubit/cubit/weather_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..fetchPopularityNews()),
        BlocProvider(create: (context) => WeatherCubit()..getWeather()),
      ],
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is WeatherFailure) {
                return Center(child: Text(state.errorMessage));
              }

              if (state is WeatherSuccess) {
                return CustomAppBar(weather: state.weatherModel);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                // SliverToBoxAdapter(child: CustomAppBar()),
                SliverToBoxAdapter(child: SizedBox(height: 24.h)),
                SliverToBoxAdapter(child: ArticleCardItem()),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: AppPaddings.horizontal32vertical8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Most Popular', style: AppStyle.semiBold24),
                        Text('See More', style: AppStyle.semiBold16),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return const SliverToBoxAdapter(child: ListShimmerh());
                    } else if (state is HomeFailure) {
                      return SliverToBoxAdapter(
                        child: Center(child: Text(state.errorMessage)),
                      );
                    } else if (state is HomeSuccess) {
                      return SliverToBoxAdapter(
                        child: MostPopularItem(
                          articles: state.articles.articles!,
                        ),
                      );
                    } else {
                      return const SliverToBoxAdapter(child: SizedBox());
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
