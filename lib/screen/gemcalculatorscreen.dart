import 'package:flutter/material.dart';

class GemCalculatorScreen extends StatelessWidget {
  final String cutType;
  final Map<String, double> cutValues;

  const GemCalculatorScreen(
      {super.key, required this.cutType, required this.cutValues});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$cutType Calculator'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cut Type: $cutType'),
            SizedBox(height: 20),
            Text('Width: ${cutValues['width']} cm'),
            Text('Volume: ${cutValues['volume']} cm³'),
            Text('Weight: ${cutValues['weight']} g'),
          ],
        ),
      ),
    );
  }
}
