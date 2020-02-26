import 'package:hive/hive.dart';
import 'package:manga/core/constants.dart';

part 'chapter_image.g.dart';

@HiveType(typeId: 3)
class ChapterImage extends HiveObject {
  @HiveField(0)
  int index;

  @HiveField(1)
  String image;

  ChapterImage();

  factory ChapterImage.fromAPIObject(List<dynamic> data) {
    return ChapterImage()
      ..index = data[0] as int
      ..image = data[1] as String;
  }

  String get imageUrl => image == null ? null : '${Constants.kImageEndpointUrl}/$image';
}
