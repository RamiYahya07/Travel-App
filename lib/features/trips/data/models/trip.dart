class TripModel {
  final int id;
  final String title;
  final String startingPlace;
  final String arrivalPlace;
  final int durationDays;
  final double costPerPerson;
  final String imageUrl;

  TripModel({
    required this.id,
    required this.title,
    required this.startingPlace,
    required this.arrivalPlace,
    required this.durationDays,
    required this.costPerPerson,
    required this.imageUrl,
  });

  factory TripModel.fromJson(Map<String, dynamic> jsonData) {
    return TripModel(
      id: jsonData['id'] as int,
      title: jsonData['title'],
      startingPlace: jsonData['starting_place'],
      arrivalPlace: jsonData['arrival_place'],
      durationDays: jsonData['duration_days'],
      costPerPerson: jsonData['cost_per_person'],
      imageUrl: jsonData['image_url'],
    );
  }
}
