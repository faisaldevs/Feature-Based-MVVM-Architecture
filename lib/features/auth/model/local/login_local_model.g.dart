// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginLocalModelAdapter extends TypeAdapter<LoginLocalModel> {
  @override
  final int typeId = 3;

  @override
  LoginLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginLocalModel(
      id: fields[0] as int,
      userName: fields[1] as String,
      userEmail: fields[2] as String,
      userPhone: fields[3] as String,
      image: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LoginLocalModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.userEmail)
      ..writeByte(3)
      ..write(obj.userPhone)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
