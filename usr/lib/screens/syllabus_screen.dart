import 'package:flutter/material.dart';

class SyllabusScreen extends StatelessWidget {
  const SyllabusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IBPS Clerk Syllabus'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Quant'),
              Tab(text: 'Reasoning'),
              Tab(text: 'English'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SyllabusList(topics: [
              'Simplification / Approximation',
              'Number Series',
              'Data Interpretation (DI)',
              'Quadratic Equations',
              'Percentages & Averages',
              'Profit & Loss',
              'Time, Work & Distance',
              'Simple & Compound Interest',
            ]),
            SyllabusList(topics: [
              'Puzzles & Seating Arrangement',
              'Syllogism',
              'Inequalities',
              'Blood Relations',
              'Coding-Decoding',
              'Direction Sense',
              'Alphanumeric Series',
            ]),
            SyllabusList(topics: [
              'Reading Comprehension',
              'Cloze Test',
              'Error Spotting',
              'Para Jumbles',
              'Fill in the Blanks',
              'Vocabulary / Synonyms / Antonyms',
            ]),
          ],
        ),
      ),
    );
  }
}

class SyllabusList extends StatefulWidget {
  final List<String> topics;
  const SyllabusList({super.key, required this.topics});

  @override
  State<SyllabusList> createState() => _SyllabusListState();
}

class _SyllabusListState extends State<SyllabusList> {
  final Map<String, bool> _completed = {};

  @override
  void initState() {
    super.initState();
    for (var topic in widget.topics) {
      _completed[topic] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.topics.length,
      itemBuilder: (context, index) {
        final topic = widget.topics[index];
        final isDone = _completed[topic] ?? false;
        return CheckboxListTile(
          title: Text(
            topic,
            style: TextStyle(
              decoration: isDone ? TextDecoration.lineThrough : null,
              color: isDone ? Colors.grey : null,
            ),
          ),
          value: isDone,
          onChanged: (val) {
            setState(() {
              _completed[topic] = val ?? false;
            });
          },
        );
      },
    );
  }
}
