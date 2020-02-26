import 'package:flutter/material.dart';
import 'package:manga/core/theme_style.dart';

class TextFieldAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Function(String text) onChanges;
  final Function() onClear;

  const TextFieldAppBar({Key key, this.title, this.onChanges, this.onClear}) : super(key: key);

  @override
  _TextFieldAppBarState createState() => _TextFieldAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _TextFieldAppBarState extends State<TextFieldAppBar> {
  final TextEditingController _textEditController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _textEditController.addListener(() => widget.onChanges(_textEditController.text));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: !_isSearching ? Text(widget.title) : _textfield(),
      actions: <Widget>[
        if (!_isSearching) ...[
          IconButton(icon: Icon(Icons.search), onPressed: () => _toggleSearchState(true)),
        ]
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _textEditController.dispose();
  }

  TextField _textfield() {
    return TextField(
      autofocus: true,
      controller: _textEditController,
      decoration: InputDecoration(
        border: InputBorder.none,
        suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: _close),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: _shapeBorder(),
        focusedBorder: _shapeBorder(),
      ),
      focusNode: _focusNode,
      onSubmitted: (_) => _focusNode.unfocus(),
    );
  }

  InputBorder  _shapeBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(ThemeStyle.cornerRadius8)),
      borderSide: BorderSide(color: Colors.grey),
    );
  }

  void _toggleSearchState(bool isSearching) {
    _isSearching = isSearching;
    if (!isSearching) {
      _textEditController.text = '';
      widget.onChanges('');
    }
    setState(() {});
  }

  void _close() {
    _toggleSearchState(false);
    widget.onClear();
  }
}
