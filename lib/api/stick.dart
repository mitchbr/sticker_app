import 'package:sticker_map/models/stick.dart';

class StickService {
  List<Stick> processSticks(List firstoreData) {
    return firstoreData.map((e) => Stick.fromFirestore(e)).toList();
  }
}
