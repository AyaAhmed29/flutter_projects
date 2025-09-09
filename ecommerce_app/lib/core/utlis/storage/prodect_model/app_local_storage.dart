import 'dart:developer';
import 'package:ecommerce_app/core/utlis/app_colors.dart';
import 'package:ecommerce_app/core/utlis/storage/prodect_model/order_model.dart';
import 'package:ecommerce_app/core/utlis/storage/prodect_model/product_model.dart'
    hide ProductModel;
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

class LocalStorage {
  static LocalStorage? _instance;
  static Box? _box;

  LocalStorage._internal();

  factory LocalStorage() {
    _instance ??= LocalStorage._internal();
    return _instance!;
  }

  static Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ProductHiveModelAdapter());
    }
    // if (!Hive.isAdapterRegistered(1)) {
    //   Hive.registerAdapter(OrderStatusAdapter());
    // }
    // if (!Hive.isAdapterRegistered(2)) {
    //   Hive.registerAdapter(OrderHiveModelAdapter());
    // }

    _box = await Hive.openBox('myBox');

    List<ProductHiveModel> products =
        (_box?.get('products') as List<dynamic>? ?? [])
            .cast<ProductHiveModel>();

    bool updated = false;
    for (var p in products) {
      if (p.quantity == null) {
        p.quantity = 1;
        updated = true;
      }
    }
    if (updated) {
      await _box?.put('products', products);
    }
  }

  Future<void> save(String key, dynamic value) async {
    await _box?.put(key, value);
  }

  Future<void> addProductToCart(
    ProductHiveModel product,
    BuildContext context,
  ) async {
    List<ProductHiveModel> cartProducts = getProducts();

    Map<String, ProductHiveModel> cartMap = {
      for (var p in cartProducts) (p.id?.trim() ?? ''): p,
    };

    bool exists = cartMap.containsKey(product.id?.trim() ?? '');
    cartMap[product.id?.trim() ?? ''] = product;
    await saveProducts(cartMap.values.toList());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.pink,
        content: Text(
          exists ? 'Product already in cart' : 'Product added to cart',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  Future<void> clearCart() async {
    await _box?.delete('products');
  }

  dynamic get(String key) {
    return _box?.get(key);
  }

  Future<void> saveProducts(List<ProductHiveModel> products) async {
    await _box?.put('products', products);
  }

  List<ProductHiveModel> getProducts() {
    final raw = _box?.get('products');
    if (raw == null) return [];
    if (raw is List<ProductHiveModel>) return raw;
    if (raw is List<dynamic>) return raw.cast<ProductHiveModel>();
    return [];
  }

  Future<void> delete(String key) async {
    await _box?.delete(key);
  }

  Future<void> clear() async {
    await _box?.clear();
  }

  // /////////////////////////////// Order ////////////////////////////////

  // Future<void> placeOrder(List<ProductHiveModel> products) async {
  //   var orderBox = await Hive.openBox<OrderHiveModel>('ordersBox');

  //   int orderNumber = orderBox.length + 1;
  //   String orderName = 'Order No. ${orderNumber.toString().padLeft(3, '0')}';
  //   String formattedDate =
  //       DateFormat('d MMM, hh:mm a').format(DateTime.now());

  //   final newOrder = OrderHiveModel(
  //     id: DateTime.now().millisecondsSinceEpoch.toString(),
  //     products: products,
  //     date: formattedDate,
  //     orderName: orderName,
  //     status: OrderStatus.active,
  //   );

  //   await orderBox.add(newOrder);

  //   await saveProducts([]);
  // }

  // Future<List<OrderHiveModel>> getOrders() async {
  //   var orderBox = await Hive.openBox<OrderHiveModel>('ordersBox');
  //   return orderBox.values.toList();
  // }
}
