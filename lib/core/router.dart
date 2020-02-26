import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patterns/details.dart';
import 'package:flutter_bloc_patterns/filter_list.dart';
import 'package:manga/data/datasource/local_datasource.dart';
import 'package:manga/domain/entity/chapter_image.dart';
import 'package:manga/domain/entity/manga.dart';
import 'package:manga/domain/entity/manga_details.dart';
import 'package:manga/domain/repository/repository.dart';
import 'package:manga/presentation/page/gallery_page.dart';
import 'package:manga/presentation/page/home_page.dart';
import 'package:manga/presentation/page/manga_details_page.dart';
import 'package:manga/presentation/store/chapter_images_store.dart';

import 'package:manga/presentation/store/gallery/gallery_bloc.dart';
import 'package:manga/presentation/store/home_store.dart';
import 'package:manga/presentation/store/manga_details_store.dart';
import 'package:manga/presentation/store/manga_store.dart';

class Router {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
    Repository repository,
  ) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => FilterListBloc<Manga, String>(HomeStore(repository)),
            child: HomePage(),
          ),
        );
      case MangaDetailsPage.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => DetailsBloc<Manga, String>(MangaStore(repository))),
              BlocProvider(create: (_) => DetailsBloc<MangaDetails, String>(MangaDetailsStore(repository)))
            ],
            child: MangaDetailsPage(settings.arguments as String),
          ),
        );
      case GalleryPage.routeName:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => DetailsBloc<List<ChapterImage>, String>(ChapterImagesStore(repository))),
              BlocProvider(
                create: (_) => GalleryBloc(),
              )
            ],
            child: GalleryPage(settings.arguments as MangaChapterArguments),
          ),
        );
      default:
        throw Error();
    }
  }
}
