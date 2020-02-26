// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_bloc.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class GalleryState extends Equatable {
  const GalleryState(this._type);

  factory GalleryState.hide() = Hide;

  factory GalleryState.show({@required String title}) = Show;

  final _GalleryState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(Hide) hide, @required R Function(Show) show}) {
    assert(() {
      if (hide == null || show == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _GalleryState.Hide:
        return hide(this as Hide);
      case _GalleryState.Show:
        return show(this as Show);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(Hide) hide,
      @required FutureOr<R> Function(Show) show}) {
    assert(() {
      if (hide == null || show == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _GalleryState.Hide:
        return hide(this as Hide);
      case _GalleryState.Show:
        return show(this as Show);
    }
  }

  R whenOrElse<R>(
      {R Function(Hide) hide,
      R Function(Show) show,
      @required R Function(GalleryState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _GalleryState.Hide:
        if (hide == null) break;
        return hide(this as Hide);
      case _GalleryState.Show:
        if (show == null) break;
        return show(this as Show);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(Hide) hide,
      FutureOr<R> Function(Show) show,
      @required FutureOr<R> Function(GalleryState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _GalleryState.Hide:
        if (hide == null) break;
        return hide(this as Hide);
      case _GalleryState.Show:
        if (show == null) break;
        return show(this as Show);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(Hide) hide,
      FutureOr<void> Function(Show) show}) {
    assert(() {
      if (hide == null && show == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _GalleryState.Hide:
        if (hide == null) break;
        return hide(this as Hide);
      case _GalleryState.Show:
        if (show == null) break;
        return show(this as Show);
    }
  }

  @override
  List get props => const [];
}

@immutable
class Hide extends GalleryState {
  const Hide._() : super(_GalleryState.Hide);

  factory Hide() {
    _instance ??= const Hide._();
    return _instance;
  }

  static Hide _instance;
}

@immutable
class Show extends GalleryState {
  const Show({@required this.title}) : super(_GalleryState.Show);

  final String title;

  @override
  String toString() => 'Show(title:${this.title})';
  @override
  List get props => [title];
}

@immutable
abstract class GalleryEvent extends Equatable {
  const GalleryEvent(this._type);

  factory GalleryEvent.hideIndicator() = HideIndicator;

  factory GalleryEvent.showIndicator() = ShowIndicator;

  factory GalleryEvent.updateIndicator({@required int index}) = UpdateIndicator;

  factory GalleryEvent.setLength({@required int length}) = SetLength;

  final _GalleryEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(HideIndicator) hideIndicator,
      @required R Function(ShowIndicator) showIndicator,
      @required R Function(UpdateIndicator) updateIndicator,
      @required R Function(SetLength) setLength}) {
    assert(() {
      if (hideIndicator == null ||
          showIndicator == null ||
          updateIndicator == null ||
          setLength == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _GalleryEvent.HideIndicator:
        return hideIndicator(this as HideIndicator);
      case _GalleryEvent.ShowIndicator:
        return showIndicator(this as ShowIndicator);
      case _GalleryEvent.UpdateIndicator:
        return updateIndicator(this as UpdateIndicator);
      case _GalleryEvent.SetLength:
        return setLength(this as SetLength);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(HideIndicator) hideIndicator,
      @required FutureOr<R> Function(ShowIndicator) showIndicator,
      @required FutureOr<R> Function(UpdateIndicator) updateIndicator,
      @required FutureOr<R> Function(SetLength) setLength}) {
    assert(() {
      if (hideIndicator == null ||
          showIndicator == null ||
          updateIndicator == null ||
          setLength == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _GalleryEvent.HideIndicator:
        return hideIndicator(this as HideIndicator);
      case _GalleryEvent.ShowIndicator:
        return showIndicator(this as ShowIndicator);
      case _GalleryEvent.UpdateIndicator:
        return updateIndicator(this as UpdateIndicator);
      case _GalleryEvent.SetLength:
        return setLength(this as SetLength);
    }
  }

  R whenOrElse<R>(
      {R Function(HideIndicator) hideIndicator,
      R Function(ShowIndicator) showIndicator,
      R Function(UpdateIndicator) updateIndicator,
      R Function(SetLength) setLength,
      @required R Function(GalleryEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _GalleryEvent.HideIndicator:
        if (hideIndicator == null) break;
        return hideIndicator(this as HideIndicator);
      case _GalleryEvent.ShowIndicator:
        if (showIndicator == null) break;
        return showIndicator(this as ShowIndicator);
      case _GalleryEvent.UpdateIndicator:
        if (updateIndicator == null) break;
        return updateIndicator(this as UpdateIndicator);
      case _GalleryEvent.SetLength:
        if (setLength == null) break;
        return setLength(this as SetLength);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(HideIndicator) hideIndicator,
      FutureOr<R> Function(ShowIndicator) showIndicator,
      FutureOr<R> Function(UpdateIndicator) updateIndicator,
      FutureOr<R> Function(SetLength) setLength,
      @required FutureOr<R> Function(GalleryEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _GalleryEvent.HideIndicator:
        if (hideIndicator == null) break;
        return hideIndicator(this as HideIndicator);
      case _GalleryEvent.ShowIndicator:
        if (showIndicator == null) break;
        return showIndicator(this as ShowIndicator);
      case _GalleryEvent.UpdateIndicator:
        if (updateIndicator == null) break;
        return updateIndicator(this as UpdateIndicator);
      case _GalleryEvent.SetLength:
        if (setLength == null) break;
        return setLength(this as SetLength);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(HideIndicator) hideIndicator,
      FutureOr<void> Function(ShowIndicator) showIndicator,
      FutureOr<void> Function(UpdateIndicator) updateIndicator,
      FutureOr<void> Function(SetLength) setLength}) {
    assert(() {
      if (hideIndicator == null &&
          showIndicator == null &&
          updateIndicator == null &&
          setLength == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _GalleryEvent.HideIndicator:
        if (hideIndicator == null) break;
        return hideIndicator(this as HideIndicator);
      case _GalleryEvent.ShowIndicator:
        if (showIndicator == null) break;
        return showIndicator(this as ShowIndicator);
      case _GalleryEvent.UpdateIndicator:
        if (updateIndicator == null) break;
        return updateIndicator(this as UpdateIndicator);
      case _GalleryEvent.SetLength:
        if (setLength == null) break;
        return setLength(this as SetLength);
    }
  }

  @override
  List get props => const [];
}

@immutable
class HideIndicator extends GalleryEvent {
  const HideIndicator._() : super(_GalleryEvent.HideIndicator);

  factory HideIndicator() {
    _instance ??= const HideIndicator._();
    return _instance;
  }

  static HideIndicator _instance;
}

@immutable
class ShowIndicator extends GalleryEvent {
  const ShowIndicator._() : super(_GalleryEvent.ShowIndicator);

  factory ShowIndicator() {
    _instance ??= const ShowIndicator._();
    return _instance;
  }

  static ShowIndicator _instance;
}

@immutable
class UpdateIndicator extends GalleryEvent {
  const UpdateIndicator({@required this.index})
      : super(_GalleryEvent.UpdateIndicator);

  final int index;

  @override
  String toString() => 'UpdateIndicator(index:${this.index})';
  @override
  List get props => [index];
}

@immutable
class SetLength extends GalleryEvent {
  const SetLength({@required this.length}) : super(_GalleryEvent.SetLength);

  final int length;

  @override
  String toString() => 'SetLength(length:${this.length})';
  @override
  List get props => [length];
}
