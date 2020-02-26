import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patterns/details.dart';
import 'package:manga/data/datasource/local_datasource.dart';
import 'package:manga/domain/entity/chapter_image.dart';
import 'package:manga/presentation/store/gallery/gallery_bloc.dart';
import 'package:manga/presentation/widget/error_message.dart';
import 'package:manga/presentation/widget/loading_indicator.dart';
import 'package:manga/presentation/widget/network_image.dart';

class GalleryPage extends StatefulWidget {
  static const String routeName = '/gallery';

  final MangaChapterArguments mangaChapterArguments;

  const GalleryPage(this.mangaChapterArguments, {Key key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  static const double indicatorCornerRaidus = 30.0;
  static const double appBarHeight = 60.0;

  final PageController _pageController = PageController(initialPage: 0);

  DetailsBloc<List<ChapterImage>, String> _detailsBloc;
  GalleryBloc _galleryCounterBloc;

  @override
  void initState() {
    super.initState();
    _detailsBloc = BlocProvider.of<DetailsBloc<List<ChapterImage>, String>>(context)
      ..loadElement(widget.mangaChapterArguments.chapterId);
    _galleryCounterBloc = BlocProvider.of<GalleryBloc>(context)..add(GalleryEvent.showIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocProvider(
        create: (_) => _galleryCounterBloc,
        child: BlocBuilder<GalleryBloc, GalleryState>(
          builder: (context, state) {
            return state.when(
              hide: (_) => Container(),
              show: (s) => CircleAvatar(
                radius: indicatorCornerRaidus,
                backgroundColor: Theme.of(context).indicatorColor,
                child: Text(s.title),
              ),
            );
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size(0.0, appBarHeight),
        child: BlocBuilder<GalleryBloc, GalleryState>(
          builder: (_, state) => state.when(
            hide: (_) => Container(),
            show: (s) => AppBar(title: Text(widget.mangaChapterArguments.title)),
          ),
        ),
      ),
      body: ViewStateBuilder<List<ChapterImage>, DetailsBloc<List<ChapterImage>, String>>(
        bloc: _detailsBloc,
        onLoading: (_) => LoadingIndicator(),
        onEmpty: (_) => _createBody([]),
        onSuccess: (_, images) => _createBody(images),
        onError: (_, error) => ErrorMessage(error),
      ),
    );
  }

  Widget _createBody(List<ChapterImage> chapterImages) {
    final images = chapterImages.map((f) => _getChapterImage(f))?.toList() ?? [];
    _galleryCounterBloc.add(GalleryEvent.setLength(length: images.length));
    if (!_galleryCounterBloc.isHidden) {
      _galleryCounterBloc.add(GalleryEvent.showIndicator());
    }
    return Container(
      color: Colors.black,
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) => _galleryCounterBloc.add(GalleryEvent.updateIndicator(index: index)),
        children: images,
      ),
    );
  }

  Widget _getChapterImage(ChapterImage chapterImage) {
    return InkResponse(
      onTap: _toggle,
      child: Container(
        color: Colors.black,
        child: Center(
          child: NetworkFadeImage(chapterImage.imageUrl, BoxFit.contain),
        ),
      ),
    );
  }

  void _toggle() {
    if (!_galleryCounterBloc.isHidden) {
      _galleryCounterBloc.add(GalleryEvent.hideIndicator());
    } else {
      _galleryCounterBloc.add(GalleryEvent.showIndicator());
    }
  }
}
