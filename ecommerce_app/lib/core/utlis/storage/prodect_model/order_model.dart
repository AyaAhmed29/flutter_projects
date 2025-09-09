// import 'package:hive/hive.dart';
// import 'product_model.dart';

// part 'order_model.g.dart';

// @HiveType(typeId: 1)
// enum OrderStatus {
//   @HiveField(0)
//   pending,
//   @HiveField(1)
//   active,
//   @HiveField(2)
//   completed,
//   @HiveField(3)
//   cancelled,
// }

// @HiveType(typeId: 2)
// class OrderHiveModel extends HiveObject {
//   @HiveField(0)
//   final String id;

//   @HiveField(1)
//   final List<ProductHiveModel> products;

//   @HiveField(2)
//   final String date; // String عشان التاريخ يبقى متنسق جاهز للعرض

//   @HiveField(3)
//   OrderStatus status;

//   @HiveField(4)
//   final String orderName; // Order No. 005

//   OrderHiveModel({
//     required this.id,
//     required this.products,
//     required this.date,
//     required this.orderName,
//     this.status = OrderStatus.pending,
//   });
// }
