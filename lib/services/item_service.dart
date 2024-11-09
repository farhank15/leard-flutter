// services/item_service.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/album_model.dart';

class ItemService {
  Future<List<AlbumModel>> fetchAlbums() async {
    final String response =
        await rootBundle.loadString('web/assets/data/items.json');
    final List<dynamic> data = json.decode(response);
    return data.map((album) => AlbumModel.fromJson(album)).toList();
  }
}
