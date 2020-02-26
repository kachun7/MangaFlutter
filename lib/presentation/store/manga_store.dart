import 'package:flutter_bloc_patterns/details.dart';
import 'package:manga/domain/entity/manga.dart';
import 'package:manga/domain/repository/repository.dart';

class MangaStore extends DetailsRepository<Manga, String> {
  final Repository repository;

  MangaStore(this.repository);

  @override
  Future<Manga> getById(String id) async => repository.getManga(id);
}
