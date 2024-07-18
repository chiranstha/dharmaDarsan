// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BlogModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogModelAdapter extends TypeAdapter<BlogModel> {
  @override
  final int typeId = 1;

  @override
  BlogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogModel(
      name: fields[0] as String,
      shortDescription: fields[1] as String,
      description: fields[2] as String,
      slug: fields[3] as String,
      content: fields[4] as String,
      metaKeyboard: fields[5] as dynamic,
      metaDescription: fields[6] as dynamic,
      isPublished: fields[7] as bool,
      blogCategoryName: fields[8] as String,
      dateMiti: fields[9] as dynamic,
      date: fields[10] as dynamic,
      imageByte: fields[11] as dynamic,
      id: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BlogModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.shortDescription)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.slug)
      ..writeByte(4)
      ..write(obj.content)
      ..writeByte(5)
      ..write(obj.metaKeyboard)
      ..writeByte(6)
      ..write(obj.metaDescription)
      ..writeByte(7)
      ..write(obj.isPublished)
      ..writeByte(8)
      ..write(obj.blogCategoryName)
      ..writeByte(9)
      ..write(obj.dateMiti)
      ..writeByte(10)
      ..write(obj.date)
      ..writeByte(11)
      ..write(obj.imageByte)
      ..writeByte(12)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
