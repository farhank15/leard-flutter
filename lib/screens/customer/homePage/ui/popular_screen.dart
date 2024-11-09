import 'package:flutter/material.dart';
import 'package:learn_flutter/services/item_service.dart';
import 'package:learn_flutter/models/album_model.dart';
import '../widgets/song_card.dart';

class PopularItemsScreen extends StatefulWidget {
  @override
  _PopularItemsScreenState createState() => _PopularItemsScreenState();
}

class _PopularItemsScreenState extends State<PopularItemsScreen> {
  List<Map<String, dynamic>> songs = [];
  final ItemService itemService = ItemService();

  @override
  void initState() {
    super.initState();
    loadSongs();
  }

  Future<void> loadSongs() async {
    List<AlbumModel> albums = await itemService.fetchAlbums();
    List<Map<String, dynamic>> allSongs = [];
    for (var album in albums) {
      for (var song in album.songs) {
        allSongs.add({
          'title': song.title,
          'artist': album.artist,
          'album': album.album,
          'imageUrl': album.image,
          'songLikes': song.songLikes,
          'playCount': song.playCount,
        });
      }
    }
    setState(() {
      songs = allSongs
        ..sort((a, b) => b['songLikes'].compareTo(a['songLikes']));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true, // Membuat GridView menyesuaikan dengan kontennya
      physics: NeverScrollableScrollPhysics(), // Menghindari konflik scroll
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.8,
      ),
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];
        return SongCard(
          title: song['title'],
          artist: song['artist'],
          album: song['album'],
          imageUrl: song['imageUrl'],
          songLikes: song['songLikes'],
          playCount: song['playCount'],
        );
      },
    );
  }
}
