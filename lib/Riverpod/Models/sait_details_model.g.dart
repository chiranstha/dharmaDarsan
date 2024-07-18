// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sait_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SiteAdapter extends TypeAdapter<Site> {
  @override
  final int typeId = 15;

  @override
  Site read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Site(
      month: fields[0] as int,
      byMonths: (fields[1] as List).cast<ByMonth>(),
    );
  }

  @override
  void write(BinaryWriter writer, Site obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.month)
      ..writeByte(1)
      ..write(obj.byMonths);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SiteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
