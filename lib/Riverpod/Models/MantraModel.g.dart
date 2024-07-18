// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MantraModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MantraModelAdapter extends TypeAdapter<MantraModel> {
  @override
  final int typeId = 7;

  @override
  MantraModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MantraModel(
      name: fields[0] as String,
      description: fields[1] as String,
      mantraType: fields[2] as int,
      mantraTypeString: fields[3] as String,
      readingTime: fields[4] as dynamic,
      id: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MantraModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.mantraType)
      ..writeByte(3)
      ..write(obj.mantraTypeString)
      ..writeByte(4)
      ..write(obj.readingTime)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MantraModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
