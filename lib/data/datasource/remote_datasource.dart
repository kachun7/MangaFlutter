import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:manga/core/constants.dart';
import 'package:manga/domain/entity/chapter_image.dart';
import 'package:manga/domain/entity/manga.dart';
import 'package:manga/domain/entity/manga_details.dart';

@injectable
class RemoteDataSource {
  Future<List<Manga>> fetchAll() async {
    final response = await http.get(Constants.listEndpointUrl);

    if (response.statusCode != HttpStatus.ok) {
      throw HttpException('Request failed with status: ${response.statusCode}', uri: response.request.url);
    } else {
      final Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> jsonMangas = jsonResponse['manga'] as List<dynamic> ;
      return jsonMangas.map((f) => Manga.fromJson(f as Map<String, dynamic>)).toList();
    }
  }

  Future<MangaDetails> fetchMangaDetails(String mangaId) async {
    final String url = '${Constants.mangaEndpointUrl}/$mangaId/';

    final response = await http.get(url);

    if (response.statusCode != HttpStatus.ok) {
      throw HttpException('Request failed with status: ${response.statusCode}', uri: response.request.url);
    } else {
      final Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse['id'] = mangaId;
      return MangaDetails.fromAPIMap(jsonResponse);
    }
  }

  Future<List<ChapterImage>> fetchChapterImages(String chapterId) async {
    final String url = '${Constants.chapterEndpointUrl}/$chapterId/';

    final response = await http.get(url);

    if (response.statusCode != HttpStatus.ok) {
      throw HttpException('Request failed with status: ${response.statusCode}', uri: response.request.url);
    } else {
      final Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> jsonImages = jsonResponse['images'] as List;
      return jsonImages.map((f) => ChapterImage.fromAPIObject(f as List<dynamic>)).toList();
    }
  }
}
