import 'package:flutter/material.dart';
import 'package:google_maps/Models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'Constants.dart';
import 'dart:convert';

Future<List<UserModel>> fetchData() async {
  List<UserModel> users;

  final response = await http.get('${(apiUrl)}/users' as Uri);
  if (response.statusCode == 200) {
    users = jsonDecode(response.body);
    return users;
  } else {
    throw Exception('Failed to load API');
  }
}
