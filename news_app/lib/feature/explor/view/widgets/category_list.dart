import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/feature/explor/cubit/cubit/news_cubit.dart';
import 'package:news_app/feature/explor/cubit/cubit/news_state.dart';
import 'package:news_app/feature/explor/view/widgets/custom_button.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'science',
      'business',
      'technology',
      'entertainment',
    ];

    return SizedBox(
      height: 65.h,
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          final cubit = NewsCubit.get(context);
          final selectedCategory = cubit.selectedCategory;

          return ListView.builder(
            padding: AppPaddings.horizontal32,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CustomButton(
                text: category,
                isSelected: category == selectedCategory,
                onPressed: () {
                  cubit.fetchNewsByCategory(category);
                },
              );
            },
          );
        },
      ),
    );
  }
}
