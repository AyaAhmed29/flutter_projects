part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderSuccess extends OrderState {}
final class CancelOrderSuccess extends OrderState {}

final class OrderFailure extends OrderState {
  final String errorMessage;

  OrderFailure(this.errorMessage);
}

final class OrderStateUpdatedSuccessfully extends OrderState {}

final class OrderStateUpdated extends OrderState {}

final class GetOrdersSuccess extends OrderState {
  final OrdersModel ordersModel;

  GetOrdersSuccess(this.ordersModel);
}

final class GetOrdersFailure extends OrderState {
  final String errorMessage;

  GetOrdersFailure(this.errorMessage);
}
final class GetOrdersEmpty extends  OrderState {
  final String Message;

  GetOrdersEmpty(this.Message);

}