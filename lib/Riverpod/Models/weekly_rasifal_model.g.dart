// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_rasifal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeeklyRasifalModelAdapter extends TypeAdapter<WeeklyRasifalModel> {
  @override
  final int typeId = 10;

  @override
  WeeklyRasifalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeeklyRasifalModel(
      weekNumber: fields[0] as int,
      year: fields[1] as int,
      description: fields[2] as String,
      rashi: fields[3] as String,
      rashiEnum: fields[4] as int,
      dayNumber: fields[5] as int,
      id: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WeeklyRasifalModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.weekNumber)
      ..writeByte(1)
      ..write(obj.year)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.rashi)
      ..writeByte(4)
      ..write(obj.rashiEnum)
      ..writeByte(5)
      ..write(obj.dayNumber)
      ..writeByte(6)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeeklyRasifalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
