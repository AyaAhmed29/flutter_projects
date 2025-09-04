import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(color: AppColors.grey, blurRadius: 2, offset: Offset(0, 2)),
        ],
      ),
      width: 163.w,
      height: 305.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              'https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d?w=1200&q=80',
              fit: BoxFit.cover,
              width: 163.w,
              height: 180.h,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mens Starry', style: AppStyle.medium16),
                Text(
                  'Mens Starry Sky Printed Shirt100% Cotton Fabric,',
                  style: AppStyle.regular10,
                  maxLines: 2, // حدد عدد السطور
                  overflow: TextOverflow.ellipsis, // منع overflow
                ),
                Text('₹399', style: AppStyle.medium12),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: 4.5,
                      itemCount: 5,
                      itemSize: 14,
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: AppColors.yellow),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      '1,52,344',
                      style: AppStyle.regular10.copyWith(color: AppColors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
