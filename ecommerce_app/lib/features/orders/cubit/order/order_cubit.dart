import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utlis/storage/prodect_model/app_local_storage.dart';
import 'package:ecommerce_app/features/orders/data/model/order_model.dart';
import 'package:ecommerce_app/features/orders/data/repo/order_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);
  int selectedStateOrder = 0;

  void fetchNewsByCategory(int state) {
    selectedStateOrder = state;
    emit(OrderStateUpdated());
  }

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

  OrdersModel? ordersModel;

  void getOrders() async {
    emit(OrderLoading());
    OrderRepo repo = OrderRepo();

    var response = await repo.getOrder();

    response.fold((error) => emit(OrderFailure(error)), (data) {
      ordersModel = data;
      emit(GetOrdersSuccess(ordersModel!));
    });
  }

  cancelOrder(int orderId) async {
    emit(OrderLoading());
    OrderRepo repo = OrderRepo();

    var response = await repo.cancelOrder(orderId);

    response.fold((error) => emit(OrderFailure(error)), (_) async {
      emit(CancelOrderSuccess());
      getOrders();
    });
  }

  void changeOrderState(int state) {
    selectedStateOrder = state;
    emit(OrderStateUpdated());
  }

  List<Active> getFilteredOrders() {
    if (ordersModel == null) return [];

    switch (selectedStateOrder) {
      case 0:
        return ordersModel!.orders!.active ?? [];
      case 1:
        return ordersModel!.orders!.completed ?? [];
      case 2:
        return ordersModel!.orders!.canceled ?? [];
      default:
        return [];
    }
  }
}
