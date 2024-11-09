import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final String title;
  final String artist;
  final String album;
  final String imageUrl;
  final int songLikes;
  final int playCount;

  const SongCard({
    super.key,
    required this.title,
    required this.artist,
    required this.album,
    required this.imageUrl,
    required this.songLikes,
    required this.playCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12.0), // Membuat kartu menjadi rounded
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar lagu
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            child: Image.network(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                Text("by $artist",
                    style: const TextStyle(color: Colors.grey, fontSize: 12.0)),
                Text("Album: $album",
                    style: const TextStyle(color: Colors.grey, fontSize: 12.0)),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.thumb_up,
                            size: 14.0, color: Colors.grey),
                        const SizedBox(width: 4.0),
                        Text(
                          '$songLikes likes',
                          style: const TextStyle(
                              fontSize: 12.0, color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.play_arrow,
                            size: 14.0, color: Colors.grey),
                        const SizedBox(width: 4.0),
                        Text(
                          '$playCount plays',
                          style: const TextStyle(
                              fontSize: 12.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
