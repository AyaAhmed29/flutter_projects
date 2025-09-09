import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  static ProductCubit get(context) => BlocProvider.of(context);

  int count = 1;
  increment() {
    count++;
    emit(ChangeCountSuccess());
  }

  decrement() {
    if (count == 1) {
      return;
    }
    count--;
    emit(ChangeCountSuccess());
  }
}
