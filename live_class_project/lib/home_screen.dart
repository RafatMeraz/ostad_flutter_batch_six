import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _numOneTEController = TextEditingController();
  final TextEditingController _numTwoTEController = TextEditingController();
  double _result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _numOneTEController,
              decoration: const InputDecoration(
                hintText: 'Number 1',
                labelText: 'Number 1'
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _numTwoTEController,
              decoration: const InputDecoration(
                hintText: 'Number 2',
                labelText: 'Number 2'
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 16,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton.icon(
                  // onPressed: () {
                  //   _add();
                  // },
                  onPressed: _add,
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                ),
                ElevatedButton.icon(
                  onPressed: _sub,
                  icon: const Icon(Icons.remove),
                  label: const Text('Sub'),
                ),
                ElevatedButton.icon(
                  onPressed: _multiply,
                  icon: const Icon(Icons.star_border),
                  label: const Text('Multiply'),
                ),
                ElevatedButton.icon(
                  onPressed: _divide,
                  icon: const Icon(Icons.ac_unit_outlined),
                  label: const Text('Divide'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text('Result: $_result'),
          ],
        ),
      ),
    );
  }

  void _add() {
    double numberOne = double.tryParse(_numOneTEController.text) ?? 0;
    double numberTwo = double.tryParse(_numTwoTEController.text) ?? 0;
    _result = numberOne + numberTwo;
    setState(() {});
  }

  void _sub() {
    double numberOne = double.tryParse(_numOneTEController.text) ?? 0;
    double numberTwo = double.tryParse(_numTwoTEController.text) ?? 0;
    _result = numberOne - numberTwo;
    setState(() {});
  }

  void _divide() {
    double numberOne = double.tryParse(_numOneTEController.text) ?? 0;
    double numberTwo = double.tryParse(_numTwoTEController.text) ?? 0;
    _result = numberOne / numberTwo;
    setState(() {});
  }

  void _multiply() {
    double numberOne = double.tryParse(_numOneTEController.text) ?? 0;
    double numberTwo = double.tryParse(_numTwoTEController.text) ?? 0;
    _result = numberOne * numberTwo;
    setState(() {});
  }

  @override
  void dispose() {
    _numOneTEController.dispose();
    _numTwoTEController.dispose();
    super.dispose();
  }
}
