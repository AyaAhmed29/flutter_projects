import 'package:ecommerce_app/core/helper/app_pop_up.dart';
import 'package:ecommerce_app/core/utlis/storage/prodect_model/app_local_storage.dart';
import 'package:ecommerce_app/core/utlis/storage/prodect_model/product_model.dart';
import 'package:ecommerce_app/features/orders/cubit/order/order_cubit.dart';
import 'package:ecommerce_app/core/utlis/app_router.dart';
import 'package:ecommerce_app/features/orders/view/widgets/place_order_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PlaceOrderView extends StatelessWidget {
  const PlaceOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = LocalStorage();
    List<ProductHiveModel> cartProducts = storage
        .getProducts()
        .cast<ProductHiveModel>();

    return BlocProvider(
      create: (context) => OrderCubit(),
      child: BlocListener<OrderCubit, OrderState>(
        listener: (context, state) {
          if (state is OrderSuccess) {
            AppPopUp.showSnackBar(
              context: context,
              text: 'Order placed successfully',
            );
            GoRouter.of(context).go(AppRouter.navigationView);
          } else if (state is OrderFailure) {
            AppPopUp.showSnackBar(context: context, text: state.errorMessage);
          }
        },
        child: Builder(
          builder: (context) {
            return ModalProgressHUD(
              progressIndicator: CircularProgressIndicator(color: Colors.pink),
              inAsyncCall: context.watch<OrderCubit>().state is OrderLoading,
              child: Scaffold(
                appBar: AppBar(title: const Text('Checkout')),
                body: PlaceOrderBody(cartProducts: cartProducts),
              ),
            );
          },
        ),
      ),
    );
  }
}
