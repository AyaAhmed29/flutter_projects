
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/utlis/storage/prodect_model/product_model.dart';
import 'package:ecommerce_app/core/widget/custom_button.dart';
import 'package:ecommerce_app/features/checkout/cubit/order/cubit/order_cubit.dart';
import 'package:ecommerce_app/features/checkout/view/widgets/cart_list_view.dart';
import 'package:ecommerce_app/features/checkout/view/widgets/determine_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceOrderBody extends StatelessWidget {
  const PlaceOrderBody({super.key, required this.cartProducts});

  final List<ProductHiveModel> cartProducts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on, color: AppColors.pink),
              SizedBox(width: 10.w),
              Text('Delivery Address', style: AppStyle.semiBold18),
            ],
          ),
          SizedBox(height: 12.h),
          DetermineLocation(),
          SizedBox(height: 16.h),
          Text('Shopping List', style: AppStyle.semiBold16),
          SizedBox(height: 16.h),
          Expanded(child: CartListView(cartProducts: cartProducts)),
          SizedBox(height: 16.h),
          CustomButton(
            ontap: () async {
              List<Map<String, dynamic>> items = cartProducts.map((product) {
                return {"product_id": product.id, "quantity": product.quantity};
              }).toList();

              // log("items to send: $items");

              final cubit = OrderCubit.get(context);
              cubit.setOrderItems(items);
              await cubit.placeOrder();
            },
            text: 'Place Order',
          ),
          SizedBox(height: 18.h),
        ],
      ),
    );
  }
}