import 'package:hive/hive.dart';

import 'chapter_image.dart';

part 'chapter_images_list.g.dart';

@HiveType(typeId: 4)
class ChapterImagesList extends HiveObject {
  @HiveField(0)
  List<ChapterImage> images;
}
