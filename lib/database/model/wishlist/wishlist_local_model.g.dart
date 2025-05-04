// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishlistLocalModelAdapter extends TypeAdapter<WishlistLocalModel> {
  @override
  final int typeId = 1;

  @override
  WishlistLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishlistLocalModel(
      id: fields[0] as String,
      name: fields[1] as String,
      currentPrice: fields[2] as double,
      regularPrice: fields[3] as double,
      imageUrl: fields[4] as String,
      ratting: fields[5] as double,
      review: fields[6] as double,
      discount: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WishlistLocalModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.currentPrice)
      ..writeByte(3)
      ..write(obj.regularPrice)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.ratting)
      ..writeByte(6)
      ..write(obj.review)
      ..writeByte(7)
      ..write(obj.discount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishlistLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
