import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String artist;
  final String album;
  final String price;
  final String imageUrl;
  final int likes;
  final List<Map<String, dynamic>> songs;

  const CardWidget({
    super.key,
    required this.artist,
    required this.album,
    required this.price,
    required this.imageUrl,
    required this.likes,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar album
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            child: Image.network(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        album,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                        overflow:
                            TextOverflow.ellipsis, // Text overflow handling
                      ),
                    ),
                    const SizedBox(width: 8.0), // Spacer kecil
                    Text(
                      "by $artist",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Likes
                    Row(
                      children: [
                        const Icon(Icons.thumb_up,
                            size: 14.0, color: Colors.grey),
                        const SizedBox(width: 4.0),
                        Text(
                          '$likes likes',
                          style: const TextStyle(
                              fontSize: 12.0, color: Colors.grey),
                        ),
                      ],
                    ),
                    // Harga
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
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
