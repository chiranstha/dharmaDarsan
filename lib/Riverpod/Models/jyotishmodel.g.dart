// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jyotishmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JyotishModelAdapter extends TypeAdapter<JyotishModel> {
  @override
  final int typeId = 6;

  @override
  JyotishModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JyotishModel(
      id: fields[0] as String,
      name: fields[1] as String,
      contact: fields[2] as String,
      shortDescription: fields[3] as String,
      photo: fields[4] as dynamic,
      description: fields[5] as String,
      qualification: fields[6] as dynamic,
      email: fields[7] as String,
      faceBookLink: fields[8] as String,
      youtubeLink: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JyotishModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.contact)
      ..writeByte(3)
      ..write(obj.shortDescription)
      ..writeByte(4)
      ..write(obj.photo)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.qualification)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.faceBookLink)
      ..writeByte(9)
      ..write(obj.youtubeLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JyotishModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
