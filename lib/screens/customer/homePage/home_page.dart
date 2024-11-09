import 'package:flutter/material.dart';
import './ui/header.dart';
import './ui/grid_screen.dart';
import './ui/popular_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Header(
          userName: "Guest", // Ganti dengan nama pengguna yang sesuai
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // Bagian Album
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Albums",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 250.0,
              child: GridScreen(),
            ),
          ),
          // Sticky Header untuk Popular Songs
          const SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 1,
            title: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Popular Songs",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Menampilkan PopularItemsScreen tanpa const
          SliverToBoxAdapter(
            child: PopularItemsScreen(),
          ),
        ],
      ),
    );
  }
}
