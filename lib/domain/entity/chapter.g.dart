// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterAdapter extends TypeAdapter<Chapter> {
  @override
  final typeId = 2;

  @override
  Chapter read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chapter()
      ..chapterId = fields[0] as String
      ..chapter = fields[1] as String
      ..timestamp = fields[2] as double
      ..title = fields[3] as String
      ..mangaId = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, Chapter obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.chapterId)
      ..writeByte(1)
      ..write(obj.chapter)
      ..writeByte(2)
      ..write(obj.timestamp)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.mangaId);
  }
}
