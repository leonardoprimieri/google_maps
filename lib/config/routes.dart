import 'package:google_maps/Screens/HomePage.dart';
import 'package:google_maps/Screens/UsersList.dart';

const String homePage = '/';
const String listUsersPage = '/users-list';

var routes = {
  homePage: (context) => const HomePage(),
  listUsersPage: (context) => const UsersList(),
};
