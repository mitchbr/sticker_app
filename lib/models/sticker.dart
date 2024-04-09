import 'package:sticker_map/models/user.dart';

class Sticker {
  late String id;
  late String title;
  late int printCount;
  late String version;
  late User creator;

  Sticker({
    required this.id,
    required this.title,
    required this.printCount,
    required this.version,
    required this.creator,
  });
}
