import 'package:flutter/widgets.dart';

class ErrorMessage extends StatelessWidget {
  final dynamic error;

  const ErrorMessage(this.error, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(child: Text(error.toString()));
}
