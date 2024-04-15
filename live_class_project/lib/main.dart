import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery
    print(MediaQuery.of(context).size);
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).orientation);
    print(MediaQuery.of(context).devicePixelRatio);
    print(MediaQuery.of(context).displayFeatures);

    print(MediaQuery.displayFeaturesOf(context));
    print(MediaQuery.sizeOf(context));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Home'),
      ),
      // body: Center(
      //   child: Wrap(
      //     alignment: WrapAlignment.center,
      //     crossAxisAlignment: WrapCrossAlignment.start,
      //     spacing: 4,
      //     children: [
      //       Text(MediaQuery.orientationOf(context).toString()),
      //       Text(MediaQuery.orientationOf(context).toString()),
      //       Text(MediaQuery.orientationOf(context).toString()),
      //       Text(MediaQuery.orientationOf(context).toString()),
      //       Text(MediaQuery.orientationOf(context).toString()),
      //       Text(MediaQuery.orientationOf(context).toString()),
      //       Text(MediaQuery.orientationOf(context).toString()),
      //       Text(MediaQuery.orientationOf(context).toString()),
      //       Text(MediaQuery.orientationOf(context).toString()),
      //       Text(MediaQuery.orientationOf(context).toString()),
      //     ],
      //   ),
      // ),
     /* body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 400) {
            return const Center(child: Text('Mobile'));
          } else if (constraints.maxWidth < 600) {
            return const Center(child: Text('Tablet'));
          } else if (constraints.maxWidth < 1200) {
            return const Center(child: Text('Laptop'));
          }

          return const Center(child: Text('Desktop'));
        },
      ),*/
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.yellow,
            );
          } else {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.red,
            );
          }
        },
      ),
    );
  }
}
