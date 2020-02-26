import 'package:flutter/material.dart';
import 'package:flutter_bloc_patterns/base_list.dart';
import 'package:manga/core/theme_style.dart';

class RefreshGridView extends StatelessWidget {
  final int itemCount;
  final Function() onRefresh;
  final Widget Function(BuildContext, int) itemBuilder;
  final int numberOfColumns;

  const RefreshGridView(this.itemCount, this.itemBuilder, this.numberOfColumns, this.onRefresh, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshView(
      color: Theme.of(context).canvasColor,
      onRefresh: onRefresh,
      child: GridView.builder(
        padding: const EdgeInsets.all(ThemeStyle.margin16),
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: numberOfColumns,
          childAspectRatio: ThemeStyle.kHomeChildAspectRatio,
          crossAxisSpacing: ThemeStyle.kHomeCrossAxisSpacing,
          mainAxisSpacing: ThemeStyle.kHomeMainAxisSpacing,
        ),
        itemBuilder: itemBuilder,
      ),
    );
  }
}
