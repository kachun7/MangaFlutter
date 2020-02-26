import 'package:hive/hive.dart';
import 'package:manga/core/constants.dart';
import 'package:manga/core/html_string_parser.dart';
import 'chapter.dart';

part 'manga_details.g.dart';

@HiveType(typeId: 1)
class MangaDetails extends HiveObject {
  @HiveField(0)
  String mangaId;

  @HiveField(1)
  String title;

  @HiveField(2)
  String author;

  @HiveField(3)
  List<String> categories;

  @HiveField(4)
  List<Chapter> chapters;

  @HiveField(5)
  double createdDate;

  @HiveField(6)
  String description;

  @HiveField(7)
  int hits;

  @HiveField(8)
  String image;

  @HiveField(9)
  double lastChapterDate;

  @HiveField(10)
  int released;

  @HiveField(11)
  int status;

  MangaDetails();

  factory MangaDetails.fromAPIMap(Map<String, dynamic> data) {
    final List<dynamic> dynamicChapters = data['chapters'] as List;
    final List<Chapter> chapters = dynamicChapters.map((e) => Chapter.fromAPIList(e as List<dynamic>)).toList();

    final List<dynamic> dynamicCategories = data['categories'] as List;
    final List<String> _categories = dynamicCategories.map((e) => '$e').toList();

    return MangaDetails()
      ..mangaId = data['id'] as String
      ..author = data['author'] as String
      ..categories = _categories
      ..chapters = chapters
      ..createdDate = data['created'] as double
      ..description = HTMLStringParser.parseHtmlString(data['description'] as String)
      ..hits = data['hits'] as int
      ..image = data['image'] as String
      ..lastChapterDate = data['last_chapter_date'] as double
      ..released = data['released'] as int
      ..status = data['status'] as int
      ..title = data['title'] as String;
  }

  String get imageUrl => image == null ? null : '${Constants.kImageEndpointUrl}/$image';
}
