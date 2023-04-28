import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int currentIndex = 0;

  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(-28.2612, -52.4083),
        infoWindow: InfoWindow(
          title: 'Passo Fundo',
        )),
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(-28, -52),
        infoWindow: InfoWindow(
          title: 'Passo Fundo 2',
        )),
  ];

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
    // make infinite

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
        ),
        body: Container(
          child: SafeArea(
            child: GoogleMap(
              initialCameraPosition: _kGoogle,
              markers: Set<Marker>.of(_markers),
              mapType: MapType.satellite,
              myLocationEnabled: true,
              compassEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                currentIndex++;
                onCurrentIndexChange();
              },
              child: currentIndex == _markers.length - 1
                  ? Icon(Icons.arrow_back)
                  : Icon(Icons.arrow_back),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
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
