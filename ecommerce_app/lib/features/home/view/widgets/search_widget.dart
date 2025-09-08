import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppPadding.all24,
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.4),
                blurRadius: 6,
              ),
            ],
          ),
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
              hintText: 'Search any Product..',
              prefixIcon: Image.asset(Assets.imagesIconsSearch),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
