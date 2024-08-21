import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? _currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text('current location => $_currentPosition'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _locationPermissionHandler(() {
            Geolocator.getCurrentPosition();
          });

          _locationPermissionHandler(() {
            Geolocator.getPositionStream().listen((p) {
              debugPrint(p.toString());
            });
          });
        },
        child: const Icon(Icons.location_history),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    // check location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      // Permission granted
      final bool isEnable = await Geolocator.isLocationServiceEnabled();
      if (isEnable) {
        // get location
        _currentPosition = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 10,
            timeLimit: Duration(seconds: 10),
          ),
        );
        if (mounted) {
          setState(() {});
        }
      } else {
        // ON gps service
        Geolocator.openLocationSettings();
      }

    } else {
      // Permission denied
      if (permission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
        return;
      }
      LocationPermission requestPermission =
          await Geolocator.requestPermission();
      if (requestPermission == LocationPermission.always ||
          requestPermission == LocationPermission.whileInUse) {
        _getCurrentLocation();
      }
    }
  }

  Future<void> _listenCurrentLocation() async {
    // check location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      // Permission granted
      final bool isEnable = await Geolocator.isLocationServiceEnabled();
      if (isEnable) {
        // get location
        Geolocator.getPositionStream(
          // locationSettings: const LocationSettings(
          //   accuracy: LocationAccuracy.best,
          //   distanceFilter: 10,
          //   timeLimit: Duration(seconds: 10),
          // ),
        ).listen((p) {
          print(p);
        });

        if (mounted) {
          setState(() {});
        }
      } else {
        // ON gps service
        Geolocator.openLocationSettings();
      }

    } else {
      // Permission denied
      if (permission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
        return;
      }
      LocationPermission requestPermission =
      await Geolocator.requestPermission();
      if (requestPermission == LocationPermission.always ||
          requestPermission == LocationPermission.whileInUse) {
        _getCurrentLocation();
      }
    }
  }

  Future<void> _locationPermissionHandler(VoidCallback startService) async {
    // check location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      // Permission granted
      final bool isEnable = await Geolocator.isLocationServiceEnabled();
      if (isEnable) {
        // START THE PROVIDED SERVICE
        startService();
      } else {
        // ON gps service
        Geolocator.openLocationSettings();
      }

    } else {
      // Permission denied
      if (permission == LocationPermission.deniedForever) {
        Geolocator.openAppSettings();
        return;
      }
      LocationPermission requestPermission =
          await Geolocator.requestPermission();
      if (requestPermission == LocationPermission.always ||
          requestPermission == LocationPermission.whileInUse) {
        _locationPermissionHandler(startService);
      }
    }
  }
}
