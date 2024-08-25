import 'package:flutter/material.dart';
import 'package:tour_guide/screens/items_screen.dart';


class Items extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const Items(this.id, this.title, this.imageUrl, {super.key});

  void nextScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ItemsScreen.routScreen, arguments: {
      "id": id,
      "title": title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => nextScreen(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.yellow,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                height: 250,
                fit: BoxFit.cover,
              )),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.4),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
