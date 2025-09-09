import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachImage extends StatelessWidget {
  const CustomCachImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });
  final String imageUrl;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal18,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          height: height ?? 125.h,
          width: width ?? 130.w,
          imageUrl: imageUrl,

          fit: BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: AppColors.pink.withValues(alpha: 0.3),
            highlightColor: AppColors.pink.withValues(alpha: 0.1),
            child: Container(height: 165.h, width: 168.w, color: Colors.white),
          ),

          errorWidget: (context, url, error) => Container(
            color: AppColors.pink.withValues(alpha: 0.3),
            child: Icon(Icons.error, size: 40),
          ),
        ),
      ),
    );
  }
}
