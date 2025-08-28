
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_style.dart';

class AuthorInfo extends StatelessWidget {
  const AuthorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12.r,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?w=256&q=80',
          ),
        ),
        SizedBox(width: 8.w),
        Text('Luc Olinga', style: AppStyle.regular14),
        SizedBox(width: 16.w),
        Text('Jan 20, 2024', style: AppStyle.regular14),
      ],
    );
  }
}
