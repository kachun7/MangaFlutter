import 'package:injectable/injectable.dart';
import 'package:manga/data/datasource/local_datasource.dart';
import 'package:manga/data/datasource/remote_datasource.dart';
import 'package:manga/domain/entity/chapter_image.dart';
import 'package:manga/domain/entity/manga.dart';
import 'package:manga/domain/entity/manga_details.dart';

@injectable
class Repository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  Repository(this.localDataSource, this.remoteDataSource);

  Future<List<Manga>> fetchAllManga() async {
    final List<Manga> data = await remoteDataSource.fetchAll();
    final list = data.where((manga) => manga.isValid()).toList();
    localDataSource.setAllManga(list);
    return localDataSource.getAllManga().where((manga) => manga.isValid()).toList();
  }

  List<Manga> getAllManga() => localDataSource.getAllManga().where((manga) => manga.isValid()).toList();

  Manga getManga(String mangaId) => localDataSource.getManga(mangaId);

  Future<MangaDetails> fetchMangaDetails(String mangaId) async {
    final localMangaDetails = localDataSource.getMangaDetails(mangaId);
    if (localMangaDetails != null && localMangaDetails.chapters.isNotEmpty) {
      return localMangaDetails;
    }

    final MangaDetails mangaDetails = await remoteDataSource.fetchMangaDetails(mangaId);
    mangaDetails.mangaId = mangaId;
    localDataSource.setMangaDetails(mangaId, mangaDetails);

    return localDataSource.getMangaDetails(mangaId);
  }

  Future<List<ChapterImage>> fetchChapterImages(String chapterId) async {
    final localChapterImages = localDataSource.getChapterImages(chapterId);
    if (localChapterImages != null) {
      return localChapterImages;
    }

    final List<ChapterImage> chapterImages = await remoteDataSource.fetchChapterImages(chapterId);
    localDataSource.setChapterImages(chapterId, chapterImages);

    return localDataSource.getChapterImages(chapterId);
  }
}
