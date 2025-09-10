class OrdersModel {
  Orders? orders;
  bool? status;

  OrdersModel({this.orders, this.status});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    orders = json['orders'] != null ? Orders.fromJson(json['orders']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (orders != null) {
      data['orders'] = orders!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Orders {
  List<Active>? active;
  List<Active>? canceled;
  List<Active>? completed;

  Orders({this.active, this.canceled, this.completed});

  Orders.fromJson(Map<String, dynamic> json) {
    if (json['active'] != null) {
      active = <Active>[];
      json['active'].forEach((v) {
        active!.add(Active.fromJson(v));
      });
    }
    if (json['canceled'] != null) {
      canceled = <Active>[];
      json['canceled'].forEach((v) {
        canceled!.add(Active.fromJson(v));
      });
    }
    if (json['completed'] != null) {
      completed = <Active>[];
      json['completed'].forEach((v) {
        completed!.add(Active.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (active != null) {
      data['active'] = active!.map((v) => v.toJson()).toList();
    }
    if (canceled != null) {
      data['canceled'] = canceled!.map((v) => v.toJson()).toList();
    }
    if (completed != null) {
      data['completed'] = completed!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Active {
  Driver? driver;
  int? id;
  List<Items>? items;
  String? orderChangeDate;
  String? orderDate;
  int? shipping;
  int? status;
  int? subtotal;
  int? tax;
  int? total;

  Active({
    this.driver,
    this.id,
    this.items,
    this.orderChangeDate,
    this.orderDate,
    this.shipping,
    this.status,
    this.subtotal,
    this.tax,
    this.total,
  });

  Active.fromJson(Map<String, dynamic> json) {
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    id = (json['id'] as num?)?.toInt();
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    orderChangeDate = json['order_change_date'];
    orderDate = json['order_date'];
    shipping = (json['shipping'] as num?)?.toInt();
    status = (json['status'] as num?)?.toInt();
    subtotal = (json['subtotal'] as num?)?.toInt();
    tax = (json['tax'] as num?)?.toInt();
    total = (json['total'] as num?)?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (driver != null) {
      data['driver'] = driver!.toJson();
    }
    data['id'] = id;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['order_change_date'] = orderChangeDate;
    data['order_date'] = orderDate;
    data['shipping'] = shipping;
    data['status'] = status;
    data['subtotal'] = subtotal;
    data['tax'] = tax;
    data['total'] = total;
    return data;
  }
}

class Driver {
  double? latitude;
  double? longitude;
  String? name;
  String? phone;

  Driver({this.latitude, this.longitude, this.name, this.phone});

  Driver.fromJson(Map<String, dynamic> json) {
    latitude = (json['latitude'] as num?)?.toDouble();
    longitude = (json['longitude'] as num?)?.toDouble();
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}

class Items {
  String? description;
  int? id;
  String? imagePath;
  String? name;
  int? price;
  int? quantity;
  double? rating;
  int? totalPrice;

  Items({
    this.description,
    this.id,
    this.imagePath,
    this.name,
    this.price,
    this.quantity,
    this.rating,
    this.totalPrice,
  });

  Items.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = (json['id'] as num?)?.toInt();
    imagePath = json['image_path'];
    name = json['name'];
    price = (json['price'] as num?)?.toInt();
    quantity = (json['quantity'] as num?)?.toInt();
    rating = (json['rating'] as num?)?.toDouble();
    totalPrice = (json['total_price'] as num?)?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['id'] = id;
    data['image_path'] = imagePath;
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    data['rating'] = rating;
    data['total_price'] = totalPrice;
    return data;
  }
}
