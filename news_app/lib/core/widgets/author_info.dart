import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helper/date_format.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_style.dart';
import 'package:news_app/feature/explor/data/model/articles_model.dart';

class AuthorInfo extends StatelessWidget {
  const AuthorInfo({super.key, this.articales});
  final ArticlesModel? articales;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12.r,
          backgroundImage: NetworkImage(
            articales?.urlToImage ??
                'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?w=256&q=80',
          ),
        ),
        SizedBox(width: 2.w),
        Text(
          articales?.author ?? 'John Doe',
          style: AppStyle.regular12.copyWith(color: AppColors.graniteGray),
        ),
        SizedBox(width: 8.w),

        Text(
          overflow: TextOverflow.ellipsis,
          dateformat(articales?.publishedAt ?? '2024-01-20T12:34:56Z'),
          style: AppStyle.regular12.copyWith(color: AppColors.graniteGray),
        ),
      ],
    );
  }
}
