import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:live_class_project/water_consume.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassCountTEController =
      TextEditingController(text: '1');
  List<WaterConsume> waterConsumeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  _buildWaterConsumeButton(),
                  const SizedBox(height: 24),
                  _buildNoOfGlassesTextField(),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'History',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Total: ${_getTotalWaterConsumeCount()}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const Divider(
              height: 20,
            ),
            _buildWaterConsumeListView()
          ],
        ),
      ),
    );
  }

  Widget _buildNoOfGlassesTextField() {
    return SizedBox(
      width: 100,
      child: TextField(
        controller: _glassCountTEController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'No of Glass',
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        ),
      ),
    );
  }

  Widget _buildWaterConsumeButton() {
    return GestureDetector(
      onTap: _addWaterConsume,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.amber, width: 8)),
        child: const Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              Icon(Icons.water_drop_outlined, size: 32),
              Text('Tap Here')
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWaterConsumeListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: waterConsumeList.length,
        itemBuilder: (context, index) {
          return _buildSingleListItem(waterConsumeList[index], index + 1);
        },
      ),
    );
  }

  Widget _buildSingleListItem(WaterConsume waterConsume, int serialNo) {
    return ListTile(
      title: Text(DateFormat.yMEd().add_jms().format(waterConsume.time)),
      leading: CircleAvatar(
        child: Text('$serialNo'),
      ),
      trailing: Text(
        waterConsume.glassCount.toString(),
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _addWaterConsume() {
    int glassCount = int.tryParse(_glassCountTEController.text) ?? 1;
    WaterConsume waterConsume =
        WaterConsume(time: DateTime.now(), glassCount: glassCount);
    waterConsumeList.add(waterConsume);
    setState(() {});
  }

  int _getTotalWaterConsumeCount() {
    int totalCount = 0;
    for (WaterConsume waterConsume in waterConsumeList) {
      totalCount += waterConsume.glassCount;
    }
    return totalCount;
  }
}
