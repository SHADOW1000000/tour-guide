import 'package:flutter/material.dart';
import 'package:tour_guide/widgets/app_data.dart';
import 'package:tour_guide/widgets/trips_screen.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  static const routScreen = '/items-screen';

  @override
  Widget build(BuildContext context) {
    final rout =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final itemId = rout["id"];
    final itemTitle = rout["title"];
    final filteredTrips =
        tripsData.where((trip) => trip.categories.contains(itemId)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(itemTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripsScreen(
            id: filteredTrips[index].id,
            title: filteredTrips[index].title,
            imageUrl: filteredTrips[index].imageUrl,
            duration: filteredTrips[index].duration,
            activities: filteredTrips[index].activities,
            season: filteredTrips[index].season,
            tripType: filteredTrips[index].tripType,
          );
        },
        itemCount: filteredTrips.length,
      ),
    );
  }
}
