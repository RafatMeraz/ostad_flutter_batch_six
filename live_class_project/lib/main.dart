/*import 'package:flutter/cupertino.dart';

void main() {
  runApp(iOSStyleApp());
}

class iOSStyleApp extends StatelessWidget {
  const iOSStyleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Home'),
          trailing: CupertinoButton(
            onPressed: () {},
            child: Icon(CupertinoIcons.add),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(
                radius: 24,
              ),
              CupertinoSwitch(value: false, onChanged: (value) {})
            ],
          ),
        ),
    );
  }
}*/

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
          brightness: Brightness.light,
          elevatedButtonTheme: ElevatedButtonThemeData(
            // style: ElevatedButton.styleFrom(
            //   backgroundColor: Colors.pink,
            //   foregroundColor: Colors.white,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(8),
            //   ),
            // ),
            style: ButtonStyles.elevatedButton,
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyles.textButton,
          ),
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(),
              focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red))),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.green,
              centerTitle: true,
              elevation: 3,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      themeMode: ThemeMode.light,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: Icon(Icons.home),
        actions: [
          Icon(Icons.add)
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Tap to edit'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Tap to edit'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {},
              child: Text('Tap to edit'),
            ),
            // 0xFF - prefix
            TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF0F6CDC), // custom color
                ),
                onPressed: () {},
                child: Text('Tap to edit'),
            ),
            TextField(),
            TextField(),
          ],
        ),
      ),
    );
  }
}

class ButtonStyles {
  static ButtonStyle elevatedButton = ElevatedButton.styleFrom(
      backgroundColor: Colors.pink,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)));

  static ButtonStyle textButton = TextButton.styleFrom(
    textStyle: TextStyle(
      fontSize: 24,
    ),
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  );
}
