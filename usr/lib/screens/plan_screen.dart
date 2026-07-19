import 'package:flutter/material.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2-Year Study Plan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPhaseCard(
              context,
              'Phase 1: Foundation (Sem 3 & 4)',
              'Build basic concepts while managing college.',
              [
                'Focus on Quantitative Aptitude basics (Percentages, Ratios, Simplification).',
                'Read English newspapers daily to improve vocabulary and comprehension.',
                'Start basic Reasoning puzzles (Blood relations, Syllogism).',
                'Dedicate 1-2 hours daily for bank prep.',
              ],
            ),
            const SizedBox(height: 16),
            _buildPhaseCard(
              context,
              'Phase 2: Consolidation (Sem 5)',
              'Increase speed and cover advanced topics.',
              [
                'Cover Data Interpretation (DI) and advanced puzzles.',
                'Start taking weekly Sectional Mocks.',
                'Begin Banking Awareness and Current Affairs (last 6 months).',
                'Increase study time to 2-3 hours daily.',
              ],
            ),
            const SizedBox(height: 16),
            _buildPhaseCard(
              context,
              'Phase 3: Mock Tests & Revision (Sem 6)',
              'Exam-oriented practice.',
              [
                'Take full-length Prelims mocks twice a week.',
                'Analyze mock tests thoroughly to identify weak areas.',
                'Revise Current Affairs daily.',
                'Practice Mains level questions.',
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhaseCard(BuildContext context, String title, String subtitle, List<String> points) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
            const SizedBox(height: 8),
            Text(subtitle, style: Theme.of(context).textTheme.titleMedium),
            const Divider(height: 24),
            ...points.map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_right, size: 20),
                  const SizedBox(width: 8),
                  Expanded(child: Text(p)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
