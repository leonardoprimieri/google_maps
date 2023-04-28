import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final List users = [];

  Future fetchUsers() async {
    var url =
        'https://644be33c4bdbc0cc3a9d3d10.mockapi.io/users?orderBy=visits&order=desc';

    var response = await http.get(Uri.parse(url));

    for (final user in jsonDecode(response.body)) {
      users.add(user);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Usuários com mais visitas'),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                tileColor: index % 2 == 0
                    ? Colors.purple.withOpacity(0.1)
                    : Colors.purple.withOpacity(0.2),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(users[index]['avatar']),
                ),
                title: Text(
                  '${users[index]['name']} ${index < 3 ? '👑' : ''} ',
                ),
                subtitle: Text(
                  'Visitas: ${users[index]['visits']}',
                ),
              ),
            );
          },
        ));
  }
}
