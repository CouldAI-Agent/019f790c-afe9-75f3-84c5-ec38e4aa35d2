import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const IBPSPlannerApp());
}

class IBPSPlannerApp extends StatelessWidget {
  const IBPSPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IBPS Clerk Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
