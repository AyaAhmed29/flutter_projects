import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/widget/item_widget.dart';
import 'package:ecommerce_app/features/home/data/model/Category_moder.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Products extends StatelessWidget {
  const Products({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(S.of(context).products, style: AppStyle.semiBold18),
        ),
        GridView.builder(
          padding: AppPadding.all16,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 163.w / 271.h,
          ),
          itemBuilder: (context, index) =>
              ItemWidget(products: products[index]),
        ),
      ],
    );
  }
}
