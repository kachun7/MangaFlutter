import 'package:flutter_bloc_patterns/details.dart';
import 'package:manga/domain/entity/manga_details.dart';
import 'package:manga/domain/repository/repository.dart';


class MangaDetailsStore extends DetailsRepository<MangaDetails, String> {
  final Repository repository;

  MangaDetailsStore(this.repository);

  @override
  Future<MangaDetails> getById(String id) => repository.fetchMangaDetails(id);
}
