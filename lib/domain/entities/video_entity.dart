class VideoEntity {
  final int id;
  final String name;
  final String synopsis;
  final bool currentlyPlaying;
  final String streamLink;
  final String genre;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final DateTime endDate;

  VideoEntity({
    required this.id,
    required this.name,
    required this.synopsis,
    required this.currentlyPlaying,
    required this.streamLink,
    required this.genre,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.endDate,
  });
}
