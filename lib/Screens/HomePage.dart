import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int currentIndex = 0;
  bool isLoading = true;
  final List<Marker> _markers = [];

  Future fetchWineries() async {
    var url = 'https://644be33c4bdbc0cc3a9d3d10.mockapi.io/wineries';

    var response = await http.get(Uri.parse(url));

    for (final winery in jsonDecode(response.body)) {
      var marker = Marker(
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration(
                size: Size(48, 48),
              ),
              'images/wine.png'),
          markerId: MarkerId(winery['id'].toString()),
          position: LatLng(winery['latitude'], winery['longitude']),
          infoWindow: InfoWindow(
            title: winery['name'],
            snippet: winery['description'],
          ));
      _markers.add(marker);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchWineries();
  }

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(-28.2612, -52.4083),
    zoom: 14.4746,
  );

  void goToPosition(lat, long) async {
    CameraPosition cameraPosition = new CameraPosition(
      target: LatLng(lat, long),
      zoom: 14,
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    setState(() {});
  }

  void onCurrentIndexChange() {
    if (currentIndex < 0) {
      currentIndex = _markers.length - 1;
    } else if (currentIndex > _markers.length - 1) {
      currentIndex = 0;
    }

    goToPosition(_markers[currentIndex].position.latitude,
        _markers[currentIndex].position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 143, 15, 157),
          title: Text("Wine Maps"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/usersList');
                },
                // list users icon
                icon: Icon(Icons.list)),
          ],
        ),
        body: !isLoading
            ? Container(
                child: SafeArea(
                  child: GoogleMap(
                    initialCameraPosition: _kGoogle,
                    markers: Set<Marker>.of(_markers),
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    compassEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () {
                currentIndex++;
                onCurrentIndexChange();
              },
              child: Icon(Icons.arrow_back),
            ),
            SizedBox(width: 16),
            FloatingActionButton(
              heroTag: 'btn2',
              onPressed: () {
                currentIndex--;
                onCurrentIndexChange();
              },
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ));
  }
}
