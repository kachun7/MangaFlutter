import 'package:flutter_bloc_patterns/filter_list.dart';
import 'package:manga/domain/entity/manga.dart';
import 'package:manga/domain/repository/repository.dart';

class HomeStore extends FilterListRepository<Manga, String> {
  final Repository repository;

  HomeStore(this.repository);

  @override
  Future<List<Manga>> getAll() async {
    final list = await repository.fetchAllManga();
    list.sort(Manga.lastChapterTimestampComparator());
    return list;
  }

  @override
  Future<List<Manga>> getBy(String filter) async {
    final mangas = repository.getAllManga();
    mangas.sort(Manga.lastChapterTimestampComparator());
    if (filter.isEmpty) {
      return mangas;
    }
    return mangas.where((element) => element.title.trim().toLowerCase().contains(filter.trim().toLowerCase())).toList();
  }
}
