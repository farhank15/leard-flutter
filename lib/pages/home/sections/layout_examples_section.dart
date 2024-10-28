import 'package:flutter/material.dart';
import '../widgets/example_card.dart';

class LayoutExamplesSection extends StatelessWidget {
  const LayoutExamplesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Layout Examples',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              ExampleCard(
                title: 'Row Layout',
                color: Colors.blue,
              ),
              ExampleCard(
                title: 'Column Layout',
                color: Colors.green,
              ),
              ExampleCard(
                title: 'Stack Layout',
                color: Colors.orange,
              ),
              ExampleCard(
                title: 'Wrap Layout',
                color: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
