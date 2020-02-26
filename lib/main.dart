import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:manga/presentation/page/home_page.dart';

import 'core/inject.dart';
import 'core/router.dart';
import 'data/datasource/local_datasource.dart';
import 'domain/entity/chapter.dart';
import 'domain/entity/chapter_image.dart';
import 'domain/entity/chapter_images_list.dart';
import 'domain/entity/manga.dart';
import 'domain/entity/manga_details.dart';
import 'domain/repository/repository.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(MangaAdapter());
  Hive.registerAdapter(MangaDetailsAdapter());
  Hive.registerAdapter(ChapterAdapter());
  Hive.registerAdapter(ChapterImageAdapter());
  Hive.registerAdapter(ChapterImagesListAdapter());

  await Hive.openBox<Manga>(LocalDataSource.mangaBoxId);
  await Hive.openBox<MangaDetails>(LocalDataSource.mangaDetailsBoxId);
  await Hive.openBox<ChapterImagesList>(LocalDataSource.chapterImagesListBoxId);
  configure();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Manga',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: HomePage.routeName,
      onGenerateRoute: (settings) => Router.generateRoute(settings, getIt<Repository>()),
    );
  }
}
