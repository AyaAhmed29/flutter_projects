import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/utlis/storage/prodect_model/app_local_storage.dart';
import 'package:ecommerce_app/core/utlis/storage/prodect_model/product_model.dart';
import 'package:ecommerce_app/core/widget/custom_appbar.dart';
import 'package:ecommerce_app/core/widget/custom_button.dart';
import 'package:ecommerce_app/features/orders/view/widgets/cart_list_view.dart';
import 'package:ecommerce_app/features/orders/view/widgets/checkout_list.dart';
import 'package:ecommerce_app/core/widget/no_prodect.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = LocalStorage();
    List<ProductHiveModel> cartProducts = storage
        .getProducts()
        .cast<ProductHiveModel>();
    double subtotal = cartProducts.fold(
      0,
      (sum, item) => sum + ((item.price ?? 0) * (item.quantity)),
    );

    double total = subtotal + 65;
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).cart),
      body: cartProducts.isEmpty
          ? NoProdect(text: S.of(context).products)
          : Padding(
              padding: AppPadding.all16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(S.of(context).shoppingList, style: AppStyle.semiBold16),
                  SizedBox(height: 16.h),
                  CartListView(cartProducts: cartProducts),
                  SizedBox(height: 25.h),
                  Divider(
                    color: AppColors.pink,
                    thickness: 1,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  CheckoutList(total: total, subtotal: subtotal),
                  SizedBox(height: 25.h),
                  CustomButton(
                    ontap: () {
                      GoRouter.of(context).push(AppRouter.placeOrderView);
                    },
                    text: S.of(context).checkout,
                  ),
                  SizedBox(height: 18.h),
                ],
              ),
            ),
    );
  }
}
