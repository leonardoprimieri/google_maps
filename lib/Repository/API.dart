import 'package:google_maps/Models/DemoModel.dart';
import 'package:http/http.dart' as http;
import 'Constants.dart';
import 'dart:convert';

Future<DemoModel> fetchData() async {
  final response = await http.get('${(apiUrl)}/users' as Uri);
  if (response.statusCode == 200) {
    return DemoModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load API');
  }
}
