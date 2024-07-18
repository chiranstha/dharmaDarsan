// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temple_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 17;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      id: fields[0] as String,
      name: fields[1] as String,
      stateId: fields[2] as int,
      districtId: fields[3] as int,
      municipalityId: fields[4] as int,
      address: fields[5] as String,
      shortDescription: fields[6] as String,
      description: fields[7] as dynamic,
      phone: fields[8] as String,
      priest: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.stateId)
      ..writeByte(3)
      ..write(obj.districtId)
      ..writeByte(4)
      ..write(obj.municipalityId)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.shortDescription)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.phone)
      ..writeByte(9)
      ..write(obj.priest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
