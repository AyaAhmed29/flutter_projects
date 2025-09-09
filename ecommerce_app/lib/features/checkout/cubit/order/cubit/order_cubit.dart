import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utlis/storage/prodect_model/app_local_storage.dart';
import 'package:ecommerce_app/features/checkout/repo/order_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> items = [];

  void setOrderItems(List<Map<String, dynamic>> newItems) {
    items = newItems;
  }

  Future<void> placeOrder() async {
    emit(OrderLoading());
    OrderRepo repo = OrderRepo();

    var response = await repo.placeOrder(items: items);

    response.fold((error) => emit(OrderFailure(error)), (_) async {
      await LocalStorage().clearCart();

      emit(OrderSuccess());
    });
  }
}
