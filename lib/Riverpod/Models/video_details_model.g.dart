// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VedioDetailAdapter extends TypeAdapter<VedioDetail> {
  @override
  final int typeId = 19;

  @override
  VedioDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VedioDetail(
      name: fields[0] as String,
      shortDescription: fields[1] as String,
      description: fields[2] as String,
      vedioLink: fields[3] as String,
      patroVideoCategoryName: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VedioDetail obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.shortDescription)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.vedioLink)
      ..writeByte(4)
      ..write(obj.patroVideoCategoryName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VedioDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
