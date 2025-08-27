class TripDetailsModel {
  final int id;
  final String title;
  final String startingPlace;
  final String startingData; //edit
  final String arrivalPlace;
  final String arrivalDate; //edit
  final int durationDays;
  final double costPerPerson;
  final int vacantPlaces;
  final String description;
  final List<String> images;

  TripDetailsModel({
    required this.id,
    required this.title,
    required this.startingPlace,
    required this.startingData,
    required this.arrivalPlace,
    required this.arrivalDate,
    required this.durationDays,
    required this.costPerPerson,
    required this.vacantPlaces,
    required this.description,
    required this.images,
  });

  factory TripDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return TripDetailsModel(
      id: jsonData['id'],
      title: jsonData['title'],
      startingPlace: jsonData['starting_place'],
      startingData: jsonData['starting_date'],
      arrivalPlace: jsonData['arrival_place'],
      arrivalDate: jsonData['arrival_date'],
      durationDays: jsonData['duration_days'],
      costPerPerson: jsonData['cost_per_person'],
      vacantPlaces: jsonData['vacant_places'],
      description: jsonData['description'],
      images: jsonData['images'],
    );
  }
}
