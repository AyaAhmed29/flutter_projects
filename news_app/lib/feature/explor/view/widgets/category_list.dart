
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/feature/explor/view/widgets/custom_button.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Travel',
      'Technology',
      'Business',
      'Entertainment',
    ];
    return SizedBox(
      height: 65.h,
      child: ListView.builder(
        padding: AppPaddings.horizontal32,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomButton(
            text: categories[index],
            isSelected: index == 0,
            onPressed: () {},
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}
