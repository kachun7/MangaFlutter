import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:manga/core/constants.dart';

part 'manga.g.dart';

@HiveType(typeId: 0)
class Manga extends HiveObject with EquatableMixin {
  @HiveField(0)
  String mangaId;

  @HiveField(1)
  int hits;

  @HiveField(2)
  String image;

  @HiveField(3)
  double lastChapterTimestamp;

  @HiveField(4)
  int status;

  @HiveField(5)
  String title;

  Manga();

  String get imageUrl => image == null ? null : '${Constants.kImageEndpointUrl}/$image';

  bool isEqual(Manga manga) {
    return mangaId == manga.mangaId &&
        hits == manga.hits &&
        image == manga.image &&
        lastChapterTimestamp == manga.lastChapterTimestamp &&
        status == manga.status &&
        title == manga.title;
  }

  bool shouldUpdate(Manga manga) {
    return mangaId == manga.mangaId &&
        hits == manga.hits &&
        image == manga.image &&
        lastChapterTimestamp < manga.lastChapterTimestamp &&
        status == manga.status &&
        title == manga.title;
  }

  bool isValid() {
    return mangaId != null && image != null && lastChapterTimestamp != null && hits != null && title != null && status == 2;
  }

  factory Manga.fromJson(Map<String, dynamic> data) {
    return Manga()
      ..mangaId = data['i'] as String
      ..hits = data['h'] as int
      ..image = data['im'] as String
      ..lastChapterTimestamp = data['ld'] != null ? (data['ld'] as double) * 1000 : null
      ..status = data['s'] as int
      ..title = data['t'] as String;
  }

  @override
  List<Object> get props => [
        mangaId,
        hits,
        image,
        lastChapterTimestamp,
        status,
        title,
      ];

  static Comparator<Manga> lastChapterTimestampComparator() =>
      (a, b) => (b.lastChapterTimestamp ?? 0).compareTo(a.lastChapterTimestamp ?? 0);
}
