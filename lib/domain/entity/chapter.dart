import 'package:hive/hive.dart';

part 'chapter.g.dart';

@HiveType(typeId: 2)
class Chapter extends HiveObject {
  @HiveField(0)
  String chapterId;

  @HiveField(1)
  String chapter;

  @HiveField(2)
  double timestamp;

  @HiveField(3)
  String title;

  @HiveField(4)
  String mangaId;

  Chapter();

  factory Chapter.fromAPIList(List<dynamic> data) {
    return Chapter()
      ..chapter = num.tryParse('${data[0]}').toString()
      // Convert from seconds to milliseconds
      ..timestamp = data[1] != null ? (data[1] as double) * 1000 : null
      ..title = data[2] as String
      ..chapterId = data[3] as String;
  }
  
  DateTime get chapterDateTime {
    final _timestamp = num.tryParse('$timestamp').toInt();
    return DateTime.fromMillisecondsSinceEpoch(_timestamp);
  }
}
