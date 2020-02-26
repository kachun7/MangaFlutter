import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patterns/details.dart';
import 'package:intl/intl.dart';
import 'package:manga/core/theme_style.dart';
import 'package:manga/data/datasource/local_datasource.dart';
import 'package:manga/domain/entity/chapter.dart';
import 'package:manga/domain/entity/manga.dart';
import 'package:manga/domain/entity/manga_details.dart';
import 'package:manga/presentation/widget/styled_widget.dart';
import 'package:manga/presentation/widget/error_message.dart';
import 'package:manga/presentation/widget/list_tile_button.dart';
import 'package:manga/presentation/widget/loading_indicator.dart';
import 'package:manga/presentation/widget/network_image.dart';

import 'gallery_page.dart';

class MangaDetailsPage extends StatefulWidget {
  static const String routeName = '/mangaDetails';

  final String mangaId;

  const MangaDetailsPage(this.mangaId, {Key key}) : super(key: key);

  @override
  _MangaDetailsPageState createState() => _MangaDetailsPageState();
}

class _MangaDetailsPageState extends State<MangaDetailsPage> {
  static const double categoryHeight = 60.0;
  static const double dividerHeight = 1.0;

  final List<Shadow> kShadows = <Shadow>[
    const Shadow(
      offset: Offset.zero,
      blurRadius: 3.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ];

  DetailsBloc<MangaDetails, String> _detailsBloc;
  DetailsBloc<Manga, String> _mangaBloc;

  @override
  void initState() {
    super.initState();
    _detailsBloc = BlocProvider.of<DetailsBloc<MangaDetails, String>>(context)..loadElement(widget.mangaId);
    _mangaBloc = BlocProvider.of<DetailsBloc<Manga, String>>(context)..loadElement(widget.mangaId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewStateBuilder<Manga, DetailsBloc<Manga, String>>(
        bloc: _mangaBloc,
        onSuccess: (context, manga) => _createAppBar(manga, _createBody()),
      ),
    );
  }

  Widget _createAppBar(Manga manga, Widget child) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        final double height = MediaQuery.of(context).size.height;
        return <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: height / 5,
            title: Text(
              manga.title,
              style: TextStyle(color: Colors.white, shadows: kShadows),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: NetworkFadeImage(manga?.imageUrl ?? '', BoxFit.cover),
            ),
          ),
        ];
      },
      body: child,
    );
  }

  Widget _createBody() {
    return ViewStateBuilder<MangaDetails, DetailsBloc<MangaDetails, String>>(
      bloc: _detailsBloc,
      onLoading: (_) => LoadingIndicator(),
      onRefreshing: (_, mangaDetails) => _getListView(mangaDetails),
      onSuccess: (_, mangaDetails) => _getListView(mangaDetails),
      onError: (_, error) => ErrorMessage(error),
    );
  }

  Widget _getListView(MangaDetails mangaDetails) {
    final chaptersTiles = mangaDetails?.chapters?.map((chapter) => _getChapterTile(mangaDetails, chapter))?.toList() ?? [];
    final List<Widget> listTiles = [_getDescriptionTile(mangaDetails), _getCategoriesListView(mangaDetails), ...chaptersTiles];
    return ListView.separated(
      itemCount: listTiles.length,
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: dividerHeight, thickness: dividerHeight, color: Theme.of(context).canvasColor),
      itemBuilder: (context, index) => listTiles[index],
    );
  }

  Widget _getDescriptionTile(MangaDetails mangaDetails) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: ExpansionTile(
        title: Text(mangaDetails.title),
        children: <Widget>[
          Txt(mangaDetails.description, style: _getDescriptionStyle(context)),
          Txt('Author: ${mangaDetails.author}', style: _getSubtitleTxtStyle(context)),
          Txt('Released: Year ${mangaDetails.released}', style: _getSubtitleTxtStyle(context)),
        ],
      ),
    );
  }

  Widget _getCategoriesListView(MangaDetails mangaDetails) {
    final List<Widget> categoriesListTiles = mangaDetails.categories
        .map((category) => StyledWidget(_getCategoryCardStyle(context), Text(category, style: TextStyle(color: Colors.white))))
        .toList();

    return Container(
      color: Theme.of(context).canvasColor,
      height: categoryHeight,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: ThemeStyle.margin16, vertical: ThemeStyle.margin8),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) => Divider(indent: ThemeStyle.margin4, color: Colors.transparent),
        itemBuilder: (context, index) => categoriesListTiles[index],
        itemCount: categoriesListTiles.length,
      ),
    );
  }

  Widget _getChapterTile(MangaDetails mangaDetails, Chapter chapter) {
    final String title = '${mangaDetails.title} ${chapter.chapter}';
    final arguments = MangaChapterArguments(title, mangaDetails.mangaId, chapter.chapterId);

    return ListTileButton(
      title,
      DateFormat.yMd().format(chapter.chapterDateTime),
      () => Navigator.of(context).pushNamed(GalleryPage.routeName, arguments: arguments),
    );
  }

  ParentStyle _getCategoryCardStyle(BuildContext context) {
    return ParentStyle()
      ..padding(horizontal: ThemeStyle.margin12, vertical: ThemeStyle.margin12)
      ..alignment.center()
      ..background.color(Theme.of(context).indicatorColor)
      ..borderRadius(all: ThemeStyle.cornerRadius20)
      ..elevation(1, color: ThemeStyle.kShadowColor);
  }

  TxtStyle _getDescriptionStyle(BuildContext context) {
    return TxtStyle()
      ..textColor(Theme.of(context).textTheme.headline.color)
      ..padding(left: ThemeStyle.margin16, right: ThemeStyle.margin16)
      ..fontSize(Theme.of(context).textTheme.body1.fontSize);
  }

  TxtStyle _getSubtitleTxtStyle(BuildContext context) {
    return TxtStyle()
      ..textColor(Theme.of(context).textTheme.headline.color)
      ..alignment.topLeft()
      ..padding(bottom: ThemeStyle.margin4)
      ..margin(left: ThemeStyle.margin16)
      ..fontSize(Theme.of(context).textTheme.caption.fontSize);
  }
}
