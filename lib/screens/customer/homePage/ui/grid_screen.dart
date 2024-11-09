import 'package:flutter/material.dart';
import 'package:learn_flutter/services/item_service.dart';
import 'package:learn_flutter/models/album_model.dart';
import '../widgets/card_widget.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({super.key});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  List<AlbumModel> albums = [];
  final ItemService itemService = ItemService();

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  // Load items using ItemService
  Future<void> loadItems() async {
    List<AlbumModel> fetchedAlbums = await itemService.fetchAlbums();
    setState(() {
      albums = fetchedAlbums;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: albums.map((album) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 200, // Set width for each Card
              child: CardWidget(
                artist: album.artist,
                album: album.album,
                price: album.price,
                imageUrl: album.image,
                likes: album.likes,
                songs: album.songs
                    .map((song) => {
                          'title': song.title,
                          'songLikes': song.songLikes,
                          'playCount': song.playCount,
                        })
                    .toList(),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
