import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/header.dart';
import './ui/grid_screen.dart';
import './ui/popular_screen.dart';
import 'package:learn_flutter/core/providers/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userName = authProvider.currentUser?.name ?? "Guest";
    final email = authProvider.currentUser?.email ?? "guest@example.com";

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Header(
          userName: userName,
          email: email,
        ),
      ),
      body: CustomScrollView(
        slivers: [
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 250.0,
                child: GridScreen(),
              ),
            ),
          ),
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: PopularItemsScreen(),
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(
        userName: userName,
        email: email,
      ),
    );
  }
}
