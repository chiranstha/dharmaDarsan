// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_rasifal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MonthRasifalModelAdapter extends TypeAdapter<MonthRasifalModel> {
  @override
  final int typeId = 11;

  @override
  MonthRasifalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MonthRasifalModel(
      month: fields[0] as int,
      year: fields[1] as int,
      description: fields[2] as String,
      rashi: fields[3] as String,
      rashiEnum: fields[4] as int,
      id: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MonthRasifalModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.month)
      ..writeByte(1)
      ..write(obj.year)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.rashi)
      ..writeByte(4)
      ..write(obj.rashiEnum)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MonthRasifalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
