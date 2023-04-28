import 'package:flutter/material.dart';
import 'package:google_maps/Models/UserModel.dart';
import 'package:google_maps/Repository/API.dart';
import 'package:google_maps/Screens/Widgets/General.dart';

class LoadHomePage extends StatefulWidget {
  @override
  _LoadHomePage createState() => _LoadHomePageState();
}


class _LoadHomePage extends State<LoadHomePage> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    _getListFromApi();
  }

  void _getListFromApi() async {
    final apiResponse = await fetchData(); // Faça a chamada da API
    setState(() {
      users = apiResponse; // Atualize o estado com a lista recebida
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: buildScreen(context),
    );
  }

  Widget buildScreen(BuildContext context) => Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
           children: [
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(users[index].name);
          ],
        ),
      );

}
