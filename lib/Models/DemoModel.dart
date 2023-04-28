class DemoModel {
  final int id;
  final String name;

  DemoModel({required this.id, required this.name});

  factory DemoModel.fromJson(Map<String, dynamic> json) {
    return DemoModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
