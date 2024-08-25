import 'package:flutter/material.dart';
import 'package:tour_guide/screens/favorites_screen.dart';
import 'package:tour_guide/widgets/app_data.dart';
import 'package:tour_guide/widgets/items.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int selectedIndex = 0;

  final List bottomScreens = [
    {
      "screen": const CategoriesScreen(),
      "title" : "Tour Guide"

    },
    {
      "screen": const FavoritesScreen(),
      "title" : "Favorites"
    },
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        iconSize: 30,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        onTap: onItemTapped,
        backgroundColor: Colors.cyan,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
      appBar: AppBar(
        title:  Center(
          child: Text(bottomScreens[selectedIndex]["title"]),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: bottomScreens[selectedIndex]["screen"],
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 7 / 8,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      children: appData
          .map((appData) => Items(appData.id, appData.title, appData.imageUrl))
          .toList(),
    );
  }
}
