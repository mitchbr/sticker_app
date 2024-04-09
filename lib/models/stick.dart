class Stick {
  // late String id;
  late DateTime createdAt;
  late DateTime lastSeenAt;
  late double latitude;
  late double longitude;
  // late User placedBy;
  late String notes;
  // late Sticker sticker;

  Stick({
    // required this.id,
    required this.createdAt,
    required this.lastSeenAt,
    required this.latitude,
    required this.longitude,
    // required this.placedBy,
    required this.notes,
    // required this.sticker
  });

  factory Stick.fromFirestore(data) {
    return Stick(
      // id: data["id"],
      createdAt: data["createdAt"].toDate(),
      lastSeenAt: data["lastSeenAt"].toDate(),
      latitude: data["latitude"],
      longitude: data["longitude"],
      // placedBy: data["placedBy"],
      notes: data["notes"],
      // sticker: data["sticker"]
    );
  }
}
