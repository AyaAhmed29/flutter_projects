import 'package:ecommerce_app/core/helper/app_pop_up.dart';
import 'package:ecommerce_app/core/utlis/app_padding.dart';
import 'package:ecommerce_app/core/widget/custom_appbar.dart';
import 'package:ecommerce_app/core/widget/no_prodect.dart';
import 'package:ecommerce_app/features/orders/cubit/order/order_cubit.dart';
import 'package:ecommerce_app/features/orders/view/widgets/order_item_card.dart';
import 'package:ecommerce_app/features/orders/view/widgets/order_state_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderView extends StatelessWidget {
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Orders'),
      body: BlocProvider(
        create: (context) => OrderCubit()..getOrders(),
        child: Column(
          children: [
            Padding(padding: AppPadding.all24, child: OrderStateList()),
            Expanded(
              child: BlocListener<OrderCubit, OrderState>(
                listener: (context, state) {
                  if (state is OrderFailure) {
                    AppPopUp.showSnackBar(
                      context: context,
                      text: state.errorMessage,
                    );
                  }
                },
                child: BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    final cubit = OrderCubit.get(context);
                    final orders = cubit.getFilteredOrders();

                    if (orders.isEmpty) {
                      return Center(
                        child: NoProdect(
                          text: cubit.selectedStateOrder == 0
                              ? "active orders"
                              : cubit.selectedStateOrder == 1
                              ? "Completed orders"
                              : "Canceled orders",
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        final items = order.items ?? [];
                        return OrderItemCard(order: order, items: items);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
