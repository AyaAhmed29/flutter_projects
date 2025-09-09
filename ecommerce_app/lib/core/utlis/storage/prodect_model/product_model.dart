import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductHiveModel extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final String? imagePath;

  @HiveField(4)
  final double? price;

  @HiveField(5)
  final double? rating;

  @HiveField(6)
  final bool? isFavorite;
  
  @HiveField(7)
  int quantity;

  ProductHiveModel({
    this.id,
    this.name,
    this.description,
    this.imagePath,
    this.price,
    this.rating,
    this.isFavorite,
    this.quantity = 1, 
  });
}
