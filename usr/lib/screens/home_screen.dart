import 'package:flutter/material.dart';
import 'plan_screen.dart';
import 'syllabus_screen.dart';
import 'tasks_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    PlanScreen(),
    SyllabusScreen(),
    TasksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.timeline),
            label: 'Study Plan',
          ),
          NavigationDestination(
            icon: Icon(Icons.book),
            label: 'Syllabus',
          ),
          NavigationDestination(
            icon: Icon(Icons.check_circle_outline),
            label: 'Daily Tasks',
          ),
        ],
      ),
    );
  }
}
