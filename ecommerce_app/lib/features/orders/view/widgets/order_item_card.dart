
import 'package:ecommerce_app/core/utlis/app_assets.dart';
import 'package:ecommerce_app/core/utlis/app_style.dart';
import 'package:ecommerce_app/core/widget/custom_cach_image.dart';
import 'package:ecommerce_app/features/orders/cubit/order/order_cubit.dart';
import 'package:ecommerce_app/features/orders/data/model/order_model.dart';
import 'package:ecommerce_app/features/orders/view/widgets/order_actions_row.dart';
import 'package:ecommerce_app/features/orders/view/widgets/order_status_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key, required this.order, required this.items});

  final Active order;
  final List<Items> items;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order #${order.id ?? ''}', style: AppStyle.bold18),
            SizedBox(height: 6.h),
            Text(
              order.orderDate != null && order.orderDate!.isNotEmpty
                  ? DateFormat('MMM dd, yyyy  hh:mm a').format(
                      DateTime.tryParse(order.orderDate!) ?? DateTime.now(),
                    )
                  : 'No Date',
              style: AppStyle.medium12,
            ),
            SizedBox(height: 10.h),
            Column(
              children: items.map((item) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCachImage(
                        imageUrl: item.imagePath ?? '',
                        width: 80.w,
                        height: 80.h,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.name ?? '', style: AppStyle.semiBold16),
                            SizedBox(height: 4.h),
                            Text('\$: ${item.price}', style: AppStyle.medium12),
                            Text(
                              '${item.quantity} item',
                              style: AppStyle.medium12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total: \$${order.total}', style: AppStyle.bold18),

                Visibility(
                  visible: OrderCubit.get(context).selectedStateOrder == 0,
                  child: OrderActionsRow(order: order),
                ),
                Visibility(
                  visible: OrderCubit.get(context).selectedStateOrder == 1,
                  child: OrderStatusRow(
                    text: 'Order delivered',
                    icon: Assets.imagesIconsTrue,
                  ),
                ),
                Visibility(
                  visible: OrderCubit.get(context).selectedStateOrder == 2,
                  child: OrderStatusRow(
                    text: 'Order Canceled',
                    icon: Assets.imagesIconsFalse,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}