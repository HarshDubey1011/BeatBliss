class Song {
  Song(
      {required this.id,
      required this.title,
      required this.artist,
      this.isFavorite = false});
  final dynamic id;
  final String title;
  final String artist;
  bool isFavorite;
}
