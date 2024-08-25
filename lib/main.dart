import 'package:flutter/material.dart';
import 'package:tour_guide/screens/first_screen.dart';
import 'package:tour_guide/screens/items_screen.dart';
import 'package:tour_guide/screens/trip_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tour Guide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FirstScreen(),
      routes: {
        ItemsScreen.routScreen : (context) => const ItemsScreen(),
        TripDetails.routScreen : (context) => const TripDetails(),
      },
    );
  }
}

