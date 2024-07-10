import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_class_project/counter_controller.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomeScreen(),
      initialBinding: ControllerBindings(),
    );
  }
}

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => CounterController());
    Get.put(CounterController());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Obx(() {
            //   return Text(
            //     'Counter value ${_counterController.count}',
            //     style: const TextStyle(fontSize: 24),
            //   );
            // })
            GetBuilder<CounterController>(
              builder: (counterController) {
                return Text(
                  'Counter value ${counterController.count}',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ProfileScreen(),
                //   ),
                // );
                Get.to(
                  () => const ProfileScreen(
                    name: 'Tamim',
                  ),
                );
              },
              child: const Text('Go to profile'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => const SettingsScreen());
              },
              child: const Text('Go to Settings'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Get.find<CounterController>().incrementCount,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String name;

  const ProfileScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          Text(name),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Back'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.off(() => const SettingsScreen());
            },
            child: const Text('Settings'),
          )
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.offAll(() => const HomeScreen());
            },
            child: const Text('Back to Home'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Back'),
          )
        ],
      ),
    );
  }
}
