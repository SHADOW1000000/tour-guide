import 'package:flutter/material.dart';
import '../widgets/app_data.dart';

class TripDetails extends StatelessWidget {
  static const routScreen = "/trip-details";

  Widget sectionTitle(String titleText) {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Text(
        titleText,
        style: const TextStyle(fontSize: 25, color: Colors.blue),
      ),
    );
  }

  const TripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip = tripsData.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTrip.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                height: 250,
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            sectionTitle('Activities'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: 200,
              child: ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            sectionTitle('Program'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: 200,
              child: ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text("day ${index + 1}"),
                  ),
                  title: Text(selectedTrip.program[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
