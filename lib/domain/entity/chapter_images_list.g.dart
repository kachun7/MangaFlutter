// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_images_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterImagesListAdapter extends TypeAdapter<ChapterImagesList> {
  @override
  final typeId = 4;

  @override
  ChapterImagesList read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterImagesList()
      ..images = (fields[0] as List)?.cast<ChapterImage>();
  }

  @override
  void write(BinaryWriter writer, ChapterImagesList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.images);
  }
}
