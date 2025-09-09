// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'order_model.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class OrderHiveModelAdapter extends TypeAdapter<OrderHiveModel> {
//   @override
//   final int typeId = 2;

//   @override
//   OrderHiveModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return OrderHiveModel(
//       id: fields[0] as String,
//       products: (fields[1] as List).cast<ProductHiveModel>(),
//       date: fields[2] as String,
//       orderName: fields[4] as String,
//       status: fields[3] as OrderStatus,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, OrderHiveModel obj) {
//     writer
//       ..writeByte(5)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.products)
//       ..writeByte(2)
//       ..write(obj.date)
//       ..writeByte(3)
//       ..write(obj.status)
//       ..writeByte(4)
//       ..write(obj.orderName);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is OrderHiveModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

// class OrderStatusAdapter extends TypeAdapter<OrderStatus> {
//   @override
//   final int typeId = 1;

//   @override
//   OrderStatus read(BinaryReader reader) {
//     switch (reader.readByte()) {
//       case 0:
//         return OrderStatus.pending;
//       case 1:
//         return OrderStatus.active;
//       case 2:
//         return OrderStatus.completed;
//       case 3:
//         return OrderStatus.cancelled;
//       default:
//         return OrderStatus.pending;
//     }
//   }

//   @override
//   void write(BinaryWriter writer, OrderStatus obj) {
//     switch (obj) {
//       case OrderStatus.pending:
//         writer.writeByte(0);
//         break;
//       case OrderStatus.active:
//         writer.writeByte(1);
//         break;
//       case OrderStatus.completed:
//         writer.writeByte(2);
//         break;
//       case OrderStatus.cancelled:
//         writer.writeByte(3);
//         break;
//     }
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is OrderStatusAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
