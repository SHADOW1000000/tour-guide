
import 'package:flutter/material.dart';
import 'package:tour_guide/models/trips.dart';
import 'package:tour_guide/screens/trip_details_screen.dart';

class TripsScreen extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final List activities;
  final Season season;
  final TripType tripType;

  const TripsScreen(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.activities,
      required this.season,
      required this.tripType});

  String get seasonText {
    switch (season) {
      case Season.summer:
        return "Summer";
      case Season.winter:
        return "Winter";
      case Season.spring:
        return "Spring";
      case Season.autumn:
        return "Autumn";
    }
  }
  String get tripTypeText {
    switch (tripType) {
      case TripType.exploration:
        return "Exp.";
      case TripType.activities:
        return "Activities";
      case TripType.recovery:
        return "Recovery";
      case TripType.therapy:
        return "Therapy";
    }
  }
  void tripScreen(BuildContext context){
    Navigator.of(context).pushNamed(TripDetails.routScreen,
    arguments: id
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => tripScreen(context),
      child: Card(
        elevation: 7,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 250,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(1)
                      ])),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$duration days",
                        style: const TextStyle(fontSize: 20, color: Colors.black87),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.sunny),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        seasonText,
                        style: const TextStyle(fontSize: 20, color: Colors.black87),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        tripTypeText,
                        style: const TextStyle(fontSize: 20, color: Colors.black87),
                        overflow: TextOverflow.fade,
                      )
                    ],
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
