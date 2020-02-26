// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterImageAdapter extends TypeAdapter<ChapterImage> {
  @override
  final typeId = 3;

  @override
  ChapterImage read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterImage()
      ..index = fields[0] as int
      ..image = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, ChapterImage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.image);
  }
}
