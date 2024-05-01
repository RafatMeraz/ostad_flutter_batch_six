import 'package:flutter/material.dart';

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
    return MaterialApp(initialRoute: '/', onGenerateRoute: _generateRoute);
  }

  MaterialPageRoute? _generateRoute(RouteSettings settings) {
    Widget? widget;
    switch (settings.name) {
      case HomeScreen.routeName:
        widget = const HomeScreen();
        break;
      case SettingsScreen.routeName:
        widget = const SettingsScreen();
        break;
      case ProfileScreen.routeName:
        String userName = settings.arguments as String;
        widget = ProfileScreen(userName: userName);
        break;
    }

    if (widget != null) {
      return MaterialPageRoute(builder: (context) => widget!);
    }
    return null;
  }
}

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SettingsScreen.routeName);
              },
              child: const Text('Settings'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, ProfileScreen.routeName,
                    arguments: 'Rafat J');
              },
              child: const Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfileScreen({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    print(userName);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: const Text('Home'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Profile'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
