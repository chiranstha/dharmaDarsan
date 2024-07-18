// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yearly_rasifal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class YearlyRasifalModelAdapter extends TypeAdapter<YearlyRasifalModel> {
  @override
  final int typeId = 12;

  @override
  YearlyRasifalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return YearlyRasifalModel(
      id: fields[0] as String,
      year: fields[1] as int,
      description: fields[2] as String,
      rashi: fields[3] as String,
      rashiEnum: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, YearlyRasifalModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.year)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.rashi)
      ..writeByte(4)
      ..write(obj.rashiEnum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YearlyRasifalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
