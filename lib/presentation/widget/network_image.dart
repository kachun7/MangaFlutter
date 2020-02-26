import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:manga/core/constants.dart';

class NetworkFadeImage extends StatefulWidget {
  final String imageUrl;
  final BoxFit boxFit;
  final AlignmentGeometry alignment;

  const NetworkFadeImage(this.imageUrl, this.boxFit, {Key key, this.alignment = Alignment.center}) : super(key: key);

  @override
  _NetworkFadeImageState createState() => _NetworkFadeImageState();
}

class _NetworkFadeImageState extends State<NetworkFadeImage> {
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      alignment: widget.alignment,
      image: NetworkImageWithRetry(widget.imageUrl),
      fit: widget.boxFit,
      placeholder: const NetworkImageWithRetry(Constants.kPlaceholderUrl),
    );
  }
}
