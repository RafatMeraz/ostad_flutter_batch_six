import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController _googleMapController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          elevation: 2,
        ),
        body: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: CameraPosition(
            target: LatLng(23.801625645512587, 90.37150332455447),
            zoom: 16.0,
          ),
          onMapCreated: (GoogleMapController controller) {
            _googleMapController = controller;
          },
          onTap: (LatLng latLng) {
            print(latLng);
          },
          zoomControlsEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          polylines: <Polyline>{
            Polyline(
              polylineId: PolylineId('sample'),
              color: Colors.pink,
              width: 20,
              visible: true,
              onTap: () {
                print('Tap on polyline');
              },
              jointType: JointType.round,
              points: [
                LatLng(23.804152968251223, 90.37413261830807),
                LatLng(23.79821345519852, 90.3691229224205),
                LatLng(23.803831796074824, 90.36921679973602)
              ],
            ),
            Polyline(
              polylineId: PolylineId('another'),
              color: Colors.yellow,
              points: [
                LatLng(23.81370801397392, 90.36938477307558),
                LatLng(23.80382811501376, 90.38012132048607)
              ],
            )
          },
          circles: <Circle>{
            Circle(
                circleId: CircleId('brta-circle'),
                center: LatLng(23.805741332438572, 90.37406623363495),
                radius: 200,
                strokeWidth: 5,
                strokeColor: Colors.blue,
                fillColor: Colors.yellow.withOpacity(0.2),
                onTap: () {
                  print('Print on brta circle');
                }),
            Circle(
                circleId: CircleId('another-circle'),
                center: LatLng(23.811625595391206, 90.3701887652278),
                radius: 200,
                strokeWidth: 5,
                strokeColor: Colors.blue,
                fillColor: Colors.yellow.withOpacity(0.2),
                onTap: () {
                  print('Print on brta circle');
                })
          },
          polygons: <Polygon>{
            Polygon(
                polygonId: PolygonId('polygone-id'),
                visible: true,
                fillColor: Colors.blueAccent,
                points: [
                  LatLng(23.79650535778466, 90.37438709288836),
                  LatLng(23.79769010733541, 90.37830378860235),
                  LatLng(23.800545794044574, 90.37438709288836),
                  LatLng(23.79895460542359, 90.37336584180593),
                  LatLng(23.793535153601166, 90.3759628906846),
                  LatLng(23.796390931634523, 90.37140648812056)
                ])
          },
          markers: <Marker>{
            Marker(
              markerId: MarkerId('abc-building'),
              position: LatLng(23.810962122269064, 90.37806272506714),
              infoWindow: InfoWindow(title: 'ABC Building'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
            ),
            Marker(
              markerId: MarkerId('location-picker'),
              position: LatLng(23.810472260372613, 90.38046699017286),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange),
              draggable: true,
              onDragEnd: (LatLng lastLatLng) {
                print('End at $lastLatLng');
              },
              onDragStart: (LatLng lastLatLng) {
                print('start at $lastLatLng');
              },
              onDrag: (LatLng lastLatLng) {
                print('on at $lastLatLng');
              },
            )
          },
        ),
      ),
    );
  }
}
