// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayDetailAdapter extends TypeAdapter<DayDetail> {
  @override
  final int typeId = 3;

  @override
  DayDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayDetail(
      description: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DayDetail obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
