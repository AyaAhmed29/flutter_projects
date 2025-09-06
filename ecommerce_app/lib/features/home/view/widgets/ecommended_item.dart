import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 305.h,

      child: ListView.builder(
        padding: AppPadding.all16,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Row(
          children: [
            // ItemWidget(),
            SizedBox(width: 16.w),
          ],
        ),
      ),
    );
  }
}
