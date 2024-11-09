// models/album_model.dart
class AlbumModel {
  final int id;
  final String artist;
  final String album;
  final String price;
  final String image;
  final int likes;
  final List<SongModel> songs;

  AlbumModel({
    required this.id,
    required this.artist,
    required this.album,
    required this.price,
    required this.image,
    required this.likes,
    required this.songs,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      id: json['id'],
      artist: json['artist'],
      album: json['album'],
      price: json['price'],
      image: json['image'],
      likes: json['likes'],
      songs: (json['songs'] as List)
          .map((song) => SongModel.fromJson(song))
          .toList(),
    );
  }
}

class SongModel {
  final String title;
  final int songLikes;
  final int playCount;

  SongModel({
    required this.title,
    required this.songLikes,
    required this.playCount,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      title: json['title'],
      songLikes: json['songLikes'],
      playCount: json['playCount'],
    );
  }
}
