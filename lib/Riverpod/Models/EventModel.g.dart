// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventModelAdapter extends TypeAdapter<EventModel> {
  @override
  final int typeId = 5;

  @override
  EventModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventModel(
      id: fields[0] as String,
      dateMiti: fields[1] as String,
      name: fields[2] as String,
      isHoliday: fields[3] as bool,
      sunrise: fields[4] as String,
      sunset: fields[5] as String,
      remainingDays: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, EventModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dateMiti)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.isHoliday)
      ..writeByte(4)
      ..write(obj.sunrise)
      ..writeByte(5)
      ..write(obj.sunset)
      ..writeByte(6)
      ..write(obj.remainingDays);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
