class DogModel {
  final int id;
  final String name;
  final String latitude;
  final String longitude;

  DogModel(
      {required this.id,
      required this.name,
      required this.latitude,
      required this.longitude});

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      id: json['id'],
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitute'],
    );
  }
}
