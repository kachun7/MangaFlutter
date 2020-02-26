import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ListTileButton extends StatefulWidget {
  final String leadingText;
  final String trailingText;
  final void Function() action;

  const ListTileButton(this.leadingText, this.trailingText, this.action, {Key key}) : super(key: key);

  @override
  _ListTileButtonState createState() => _ListTileButtonState();
}

class _ListTileButtonState extends State<ListTileButton> {
  @override
  Widget build(BuildContext context) {
    return Parent(
      style: _getStyle(context),
      gesture: Gestures()..onTap(widget.action),
      child: ListTile(
        title: Text('${widget.leadingText}'),
        subtitle: Text('${widget.trailingText}'),
        trailing: Icon(Entypo.chevron_right),
      ),
    );
  }

  ParentStyle _getStyle(BuildContext context) {
    return ParentStyle()
      ..alignment.center()
      ..background.color(Theme.of(context).canvasColor)
      ..ripple(true)
      ..boxShadow(color: const Color(0x66000000), blur: 0.2, offset: Offset.zero, spread: 0.2)
      ..animate(300, Curves.easeOut);
  }
}
