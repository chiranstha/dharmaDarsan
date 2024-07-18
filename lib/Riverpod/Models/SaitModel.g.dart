// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SaitModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaitModelAdapter extends TypeAdapter<SaitModel> {
  @override
  final int typeId = 13;

  @override
  SaitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaitModel(
      category: fields[0] as String,
      sites: (fields[1] as List).cast<Site>(),
    );
  }

  @override
  void write(BinaryWriter writer, SaitModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.sites);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
