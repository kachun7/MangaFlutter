import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:manga/domain/entity/chapter_image.dart';
import 'package:manga/domain/entity/chapter_images_list.dart';
import 'package:manga/domain/entity/manga.dart';
import 'package:manga/domain/entity/manga_details.dart';

class MangaChapterArguments {
  final String title;
  final String mangaId;
  final String chapterId;

  MangaChapterArguments(this.title, this.mangaId, this.chapterId);
}

@injectable
class LocalDataSource {
  static const String mangaBoxId = 'manga';
  static const String mangaDetailsBoxId = 'mangaDetails';
  static const String chapterImagesListBoxId = 'chapterImagesList';

  Future<void> setAllManga(List<Manga> data) async {
    final box = Hive.box<Manga>(mangaBoxId);
    for (final Manga element in data) {
      box.put(element.mangaId, element);
    }
  }

  List<Manga> getAllManga() => Hive.box<Manga>(mangaBoxId).values.toList();

  Manga getManga(String mangaId) {
    return Hive.box<Manga>(mangaBoxId).values.firstWhere((element) => element.mangaId == mangaId);
  }

  Future<void> setMangaDetails(String mangaId, MangaDetails mangaDetails) {
    return Hive.box<MangaDetails>(mangaDetailsBoxId).put(mangaId, mangaDetails);
  }

  MangaDetails getMangaDetails(String mangaId) => Hive.box<MangaDetails>(mangaDetailsBoxId).get(mangaId);

  Future<void> setChapterImages(String chapterId, List<ChapterImage> chapterImages) {
    final list = ChapterImagesList()..images = chapterImages;
    return Hive.box<ChapterImagesList>(chapterImagesListBoxId).put(chapterId, list);
  }

  List<ChapterImage> getChapterImages(String chapterId) {
    return Hive.box<ChapterImagesList>(chapterImagesListBoxId).get(chapterId)?.images;
  }
}
