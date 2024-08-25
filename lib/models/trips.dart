enum Season{
  summer,
  winter,
  spring,
  autumn,
}
enum TripType{
  exploration,
  recovery,
  activities,
  therapy,
}

class Trip{
  final String id;
  final List categories;
  final String title;
  final String imageUrl;
  final List activities;
  final List program;
  final int duration;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;
  final Season season;
  final TripType tripType;

 const Trip({
   required this.id,
   required this.categories,
   required this.title,
   required this.imageUrl,
   required this.activities,
   required this.program,
   required this.duration,
   required this.isInSummer,
   required this.isInWinter,
   required this.isForFamilies,
   required this.season,
   required this.tripType
 });

}
