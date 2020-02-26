// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MangaDetailsAdapter extends TypeAdapter<MangaDetails> {
  @override
  final typeId = 1;

  @override
  MangaDetails read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MangaDetails()
      ..mangaId = fields[0] as String
      ..title = fields[1] as String
      ..author = fields[2] as String
      ..categories = (fields[3] as List)?.cast<String>()
      ..chapters = (fields[4] as List)?.cast<Chapter>()
      ..createdDate = fields[5] as double
      ..description = fields[6] as String
      ..hits = fields[7] as int
      ..image = fields[8] as String
      ..lastChapterDate = fields[9] as double
      ..released = fields[10] as int
      ..status = fields[11] as int;
  }

  @override
  void write(BinaryWriter writer, MangaDetails obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.mangaId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.categories)
      ..writeByte(4)
      ..write(obj.chapters)
      ..writeByte(5)
      ..write(obj.createdDate)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.hits)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.lastChapterDate)
      ..writeByte(10)
      ..write(obj.released)
      ..writeByte(11)
      ..write(obj.status);
  }
}
