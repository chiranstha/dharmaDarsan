// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'templemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TempleModelAdapter extends TypeAdapter<TempleModel> {
  @override
  final int typeId = 16;

  @override
  TempleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TempleModel(
      totalCount: fields[0] as int,
      items: (fields[1] as List).cast<Item>(),
    );
  }

  @override
  void write(BinaryWriter writer, TempleModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.totalCount)
      ..writeByte(1)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TempleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
