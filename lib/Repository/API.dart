import 'package:google_maps/Models/DogModel.dart';
import 'package:http/http.dart' as http;
import 'Constants.dart';
import 'dart:convert';

Future<DogModel> fetchData() async {
  final response = await http.get('${(apiUrl)}/dogs' as Uri);
  if (response.statusCode == 200) {
    return DogModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load API');
  }
}
