import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patterns/base_list.dart';
import 'package:flutter_bloc_patterns/details.dart';
import 'package:flutter_bloc_patterns/filter_list.dart';
import 'package:manga/core/theme_style.dart';
import 'package:manga/domain/entity/manga.dart';
import 'package:manga/presentation/widget/styled_widget.dart';
import 'package:manga/presentation/widget/loading_indicator.dart';
import 'package:manga/presentation/widget/network_image.dart';
import 'package:manga/presentation/widget/refresh_grid_view.dart';
import 'package:manga/presentation/widget/textfield_app_bar.dart';

import 'manga_details_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const int kMangaTitleNumberOfLines = 1;

  ParentStyle kListTileParentStyle = ParentStyle()
    ..borderRadius(all: ThemeStyle.cornerRadius8)
    ..boxShadow(color: Colors.black12, offset: const Offset(1.0, 1.0));

  int _numberOfColumns = 3;

  FilterListBloc<Manga, String> _listBloc;

  @override
  void initState() {
    super.initState();
    _listBloc = BlocProvider.of<FilterListBloc<Manga, String>>(context)..loadElements();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _numberOfColumns = (MediaQuery.of(context).size.width / ThemeStyle.kCellWidth).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextFieldAppBar(
        title: 'Manga',
        onChanges: (keyword) => _listBloc.loadElements(filter: keyword),
        onClear: () => _listBloc.loadElements(filter: ''),
      ),
      body: ViewStateBuilder<List<Manga>, FilterListBloc<Manga, String>>(
        bloc: _listBloc,
        onLoading: (context) => LoadingIndicator(),
        onRefreshing: (context, manga) => _getGridView(manga, _refreshMangas),
        onSuccess: (context, manga) => _getGridView(manga, _refreshMangas),
      ),
    );
  }

  void _refreshMangas() => _listBloc.refreshElements();

  Widget _getGridView(List<Manga> mangas, Function() onRefresh) {
    return RefreshGridView(
        mangas.length, (context, index) => _getChildBoxView(context, mangas[index]), _numberOfColumns, onRefresh);
  }

  Widget _getChildBoxView(BuildContext context, Manga manga) => StyledWidget(kListTileParentStyle, _getListTile(context, manga));

  Widget _getListTile(BuildContext context, Manga manga) {
    return InkResponse(
      onTap: () => Navigator.of(context).pushNamed(MangaDetailsPage.routeName, arguments: manga.mangaId),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(ThemeStyle.cornerRadius8),
              child: NetworkFadeImage(manga.imageUrl, BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Txt(manga.title, style: _getMangaTitleStyle(context)),
          ),
        ],
      ),
    );
  }

  TxtStyle _getMangaTitleStyle(BuildContext context) {
    return TxtStyle()
      ..background.color(Colors.blueGrey[50])
      ..textColor(Theme.of(context).textTheme.headline.color)
      ..maxLines(kMangaTitleNumberOfLines)
      ..padding(all: ThemeStyle.margin4)
      ..fontSize(Theme.of(context).textTheme.caption.fontSize);
  }
}
