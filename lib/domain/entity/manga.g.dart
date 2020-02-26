// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MangaAdapter extends TypeAdapter<Manga> {
  @override
  final typeId = 0;

  @override
  Manga read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Manga()
      ..mangaId = fields[0] as String
      ..hits = fields[1] as int
      ..image = fields[2] as String
      ..lastChapterTimestamp = fields[3] as double
      ..status = fields[4] as int
      ..title = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, Manga obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.mangaId)
      ..writeByte(1)
      ..write(obj.hits)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.lastChapterTimestamp)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.title);
  }
}
