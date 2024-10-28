import 'package:flutter/material.dart';
import 'sections/welcome_section.dart';
import 'sections/core_concepts_section.dart';
import 'sections/layout_examples_section.dart';
import 'sections/sign_in_section.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              WelcomeSection(),
              SizedBox(height: 32),
              CoreConceptsSection(),
              SizedBox(height: 32),
              LayoutExamplesSection(),
              SizedBox(height: 32),
              SignInSection(),
            ],
          ),
        ),
      ),
    );
  }
}
