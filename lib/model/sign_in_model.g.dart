// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class signInModelAdapter extends TypeAdapter<signInModel> {
  @override
  final int typeId = 0;

  @override
  signInModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return signInModel(
      email: fields[0] as String,
      password: fields[1] as String,
      id: fields[3] as String,
      name: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, signInModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is signInModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
