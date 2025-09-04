import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/feature/explor/cubit/cubit/news_cubit.dart';
import 'package:news_app/feature/explor/cubit/cubit/news_state.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      GoRouter.of(context).go(AppRouter.welcomeView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Center(
        child: SizedBox(
          height: 50.h,
          width: 176.w,
          child: SvgPicture.asset(
            Assets.assetsImagesAppname,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..fetchNews(),
      child: Scaffold(
        appBar: AppBar(title: Text('News')),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              child: Icon(Icons.filter_alt),
              onPressed: () {
                // show dialog has search field
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text('Filter'),
                      content: TextField(
                        onSubmitted: (value) {
                          Navigator.pop(context, value);
                        },
                        decoration: InputDecoration(labelText: 'Search'),
                        // controller: NewsCubit.get(context).searchController,
                      ),
                    );
                  },
                ).then((value) {
                  print(value);
                  if (value != null &&
                      value != NewsCubit.get(context).searchController.text) {
                    NewsCubit.get(context).searchController.text = value
                        .toString();
                    NewsCubit.get(context).fetchNews();
                  }
                });
              },
            );
          },
        ),
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                NewsCubit.get(context).fetchNews();
              },
              child: Builder(
                builder: (context) {
                  if (state is NewsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is NewsFailure) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state is NewsSuccess) {
                    if (state.articles.articles?.isEmpty ?? true) {
                      return Center(child: Text('No Data'));
                    }
                    return ListView.builder(
                      itemCount: state.articles.articles!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                // image
                                CachedNetworkImage(
                                  height: 100,
                                  imageUrl:
                                      state
                                          .articles
                                          .articles![index]
                                          .urlToImage ??
                                      '',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                              Colors.red,
                                              BlendMode.colorBurn,
                                            ),
                                          ),
                                        ),
                                      ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                // Image.network(state.model.articles![index].urlToImage??''),
                                Text(
                                  state.articles.articles![index].title ?? '',
                                ),
                                Text(
                                  state.articles.articles![index].description ??
                                      '',
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
