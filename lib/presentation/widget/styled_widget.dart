import 'package:division/division.dart';
import 'package:flutter/material.dart';

class StyledWidget extends StatelessWidget {
  final Widget child;

  final ParentStyle parentStyle;

  const StyledWidget(this.parentStyle, this.child, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Parent(style: parentStyle, child: child);
}
