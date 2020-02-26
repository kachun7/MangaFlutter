import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:super_enum/super_enum.dart';

part 'gallery_bloc.g.dart';

@superEnum
enum _GalleryState {
  @object
  Hide,

  @Data(fields: [DataField<String>('title')])
  Show,
}

@superEnum
enum _GalleryEvent {
  @object
  HideIndicator,

  @object
  ShowIndicator,

  @Data(fields: [DataField<int>('index')])
  UpdateIndicator,

  @Data(fields: [DataField<int>('length')])
  SetLength,
}

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  bool isHidden = true;

  int _currentIndex = 0;
  int _length = 0;

  @override
  GalleryState get initialState => GalleryState.hide();

  @override
  Stream<GalleryState> mapEventToState(
    GalleryEvent event,
  ) async* {
    switch (event._type) {
      case _GalleryEvent.HideIndicator:
        isHidden = true;
        yield GalleryState.hide();
        break;

      case _GalleryEvent.ShowIndicator:
        isHidden = false;
        yield _indicatorTitle();
        break;

      case _GalleryEvent.UpdateIndicator:
        _currentIndex = (event as UpdateIndicator).index;
        if (!isHidden) {
          yield _indicatorTitle();
        }
        break;

      case _GalleryEvent.SetLength:
        _length = (event as SetLength).length;
        break;
      default:
    }
  }

  GalleryState _indicatorTitle() {
    return GalleryState.show(title: '${_currentIndex + 1}/$_length');
  }
}
