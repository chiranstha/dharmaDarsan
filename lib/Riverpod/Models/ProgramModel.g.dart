// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProgramModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProgramModelAdapter extends TypeAdapter<ProgramModel> {
  @override
  final int typeId = 8;

  @override
  ProgramModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProgramModel(
      id: fields[0] as String,
      dateMiti: fields[1] as String,
      location: fields[2] as String,
      name: fields[3] as String,
      shortDescription: fields[4] as String,
      image: fields[5] as dynamic,
      description: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProgramModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dateMiti)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.shortDescription)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgramModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
