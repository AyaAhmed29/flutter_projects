class ProductsModel {
  List<Product>? products;
  bool? status;

  ProductsModel({this.products, this.status});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class BestSellerModel {
  List<Product>? bestSellerProducts;
  bool? status;

  BestSellerModel({this.bestSellerProducts, this.status});

  BestSellerModel.fromJson(Map<String, dynamic> json) {
    if (json['best_seller_products'] != null) {
      bestSellerProducts = [];
      json['best_seller_products'].forEach((v) {
        bestSellerProducts!.add(Product.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (bestSellerProducts != null) {
      data['best_seller_products'] =
          bestSellerProducts!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Product {
  int? bestSeller;
  Category? category;
  String? description;
  int? id;
  String? imagePath;
  bool? isFavorite;
  String? name;
  double? price;
  double? rating;

  Product({
    this.bestSeller,
    this.category,
    this.description,
    this.id,
    this.imagePath,
    this.isFavorite,
    this.name,
    this.price,
    this.rating,
  });

  Product.fromJson(Map<String, dynamic> json) {
    bestSeller = json['best_seller'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    description = json['description'];
    id = json['id'];
    imagePath = json['image_path'];
    isFavorite = json['is_favorite'];
    name = json['name'];
    price = json['price'] != null ? (json['price'] as num).toDouble() : null;
    rating = json['rating'] != null ? (json['rating'] as num).toDouble() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['best_seller'] = bestSeller;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['description'] = description;
    data['id'] = id;
    data['image_path'] = imagePath;
    data['is_favorite'] = isFavorite;
    data['name'] = name;
    data['price'] = price;
    data['rating'] = rating;
    return data;
  }
}

class Category {
  String? description;
  int? id;
  String? imagePath;
  String? title;

  Category({this.description, this.id, this.imagePath, this.title});

  Category.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    imagePath = json['image_path'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['id'] = id;
    data['image_path'] = imagePath;
    data['title'] = title;
    return data;
  }
}
