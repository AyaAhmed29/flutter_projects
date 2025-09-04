import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.all16,
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey.withValues(alpha: 0.4), blurRadius: 6),
          ],
        ),
        child: TextField(
          textInputAction: TextInputAction.done,
          onSubmitted: (value) {},

          decoration: InputDecoration(
            hintText: 'Search any Product..',
            prefixIcon: IconButton(
              onPressed: () {},
              icon: Image.asset(Assets.imagesIconsSearch),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
      ),
    );
  }
}
