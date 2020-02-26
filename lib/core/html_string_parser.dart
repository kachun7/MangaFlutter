import 'package:html/dom.dart';
import 'package:html/parser.dart';

class HTMLStringParser {
  static String parseHtmlString(String htmlString) {
    final Document document = parse(htmlString);
    return parse(document.body.text).documentElement.text;
  }
}
