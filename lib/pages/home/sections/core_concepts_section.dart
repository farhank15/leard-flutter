import 'package:flutter/material.dart';
import '../widgets/concept_card.dart';

class CoreConceptsSection extends StatelessWidget {
  const CoreConceptsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Core Concepts',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: const [
            ConceptCard(
              icon: Icons.grid_4x4,
              title: 'GridView',
              description: 'Layout widgets in a grid pattern',
            ),
            ConceptCard(
              icon: Icons.view_column,
              title: 'Flexbox',
              description: 'Row and Column layouts',
            ),
            ConceptCard(
              icon: Icons.padding,
              title: 'Padding',
              description: 'Control spacing around widgets',
            ),
            ConceptCard(
              icon: Icons.aspect_ratio,
              title: 'Responsive',
              description: 'Adapt to different screen sizes',
            ),
          ],
        ),
      ],
    );
  }
}
