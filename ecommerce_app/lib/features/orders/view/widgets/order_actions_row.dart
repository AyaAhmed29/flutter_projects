
import 'package:ecommerce_app/core/helper/app_pop_up.dart';
import 'package:ecommerce_app/features/auth/view/widgets/custom_dialog.dart';
import 'package:ecommerce_app/features/orders/cubit/order/order_cubit.dart';
import 'package:ecommerce_app/features/orders/data/model/order_model.dart';
import 'package:ecommerce_app/features/orders/view/widgets/custom_state_button.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderActionsRow extends StatelessWidget {
  const OrderActionsRow({super.key, required this.order});

  final Active order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomStateButton(
          text: 'Cancel',
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => CustomDialog(
                onConfirm: () async {
                  AppPopUp.showSnackBar(
                    context: context,
                    text:S.of(context).orderCanceledSuccessfully,
                  );

                  OrderCubit.get(context).cancelOrder(order.id!);
                  OrderCubit.get(context).getOrders();
                  OrderCubit.get(context).selectedStateOrder = 0;
                },
                title: S.of(context).confirmation,
                content: S.of(context).cancelConfirmationQuestion,
              ),
            );
          },
          isSelected: true,
        ),
        SizedBox(width: 5.w),
        CustomStateButton(
          text: S.of(context).trackDriver,
          onPressed: () {},
          isSelected: true,
        ),
      ],
    );
  }
}
