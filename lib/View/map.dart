import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spaceX_app/Model/landpad.dart';
import 'package:spaceX_app/utils/api.dart';
import 'package:spaceX_app/utils/locator.dart';

class Map extends StatefulWidget {
  Map({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Set<Marker> markers = Set();

  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 3,
  );

  void onLandpadTap() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: locator<ApiManager>().loadLandpads(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          for (Landpad item in snapshot.data) {
            markers.add(new Marker(
                markerId: MarkerId(item.id),
                position: LatLng(item.latitude, item.longitude),
                onTap: onLandpadTap,
                infoWindow: InfoWindow(
                  title: item.name,
                  snippet: item.locality,
                )));
            print(item.locality);
          }
          return GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _initialPosition,
              markers: markers);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
