import 'package:flutter/cupertino.dart';

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
}
