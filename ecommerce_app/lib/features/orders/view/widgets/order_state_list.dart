
import 'package:ecommerce_app/features/orders/cubit/order/order_cubit.dart';
import 'package:ecommerce_app/features/orders/view/widgets/custom_state_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderStateList extends StatelessWidget {
  const OrderStateList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = ['Active', 'Completed', 'Canceled'];

    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        final cubit = OrderCubit.get(context);
        final selectedIndex = cubit.selectedStateOrder;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(categories.length, (index) {
            final category = categories[index];
            return CustomStateButton(
              text: category,
              isSelected: index == selectedIndex,
              onPressed: () {
                cubit.fetchNewsByCategory(index);
              },
            );
          }),
        );
      },
    );
  }
}