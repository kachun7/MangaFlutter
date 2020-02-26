import 'package:flutter_bloc_patterns/details.dart';
import 'package:manga/domain/entity/chapter_image.dart';
import 'package:manga/domain/repository/repository.dart';

class ChapterImagesStore extends DetailsRepository<List<ChapterImage>, String> {
  final Repository repository;

  ChapterImagesStore(this.repository);

  @override
  Future<List<ChapterImage>> getById(String id) => repository.fetchChapterImages(id);
}
