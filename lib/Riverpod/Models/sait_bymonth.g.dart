// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sait_bymonth.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ByMonthAdapter extends TypeAdapter<ByMonth> {
  @override
  final int typeId = 14;

  @override
  ByMonth read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ByMonth(
      dateMiti: fields[0] as String,
      description: fields[1] as String,
      dateOnly: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ByMonth obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.dateMiti)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.dateOnly);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ByMonthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
