import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'gemcalculator.dart';

class CapturedGemScreen extends StatelessWidget {
  final Uint8List imageBytes;
  final double specificGravity;

  const CapturedGemScreen(
      {super.key, required this.imageBytes, required this.specificGravity});

  void navigateToGemCalculator(BuildContext context, String cutType) {
    var width;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GemCalculator(
          cutType: cutType,
          specificGravity: 3.99,
          width: width,
          cuttingLoss: 0.3,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blue Sapphire'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Image.memory(
              imageBytes,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              'Select the Gem cut Shape',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text('Brilliant Heart Cut'),
                    onTap: () =>
                        navigateToGemCalculator(context, 'Brilliant Heart Cut'),
                  ),
                  ListTile(
                    title: const Text('Brilliant Marquise Cut'),
                    onTap: () => navigateToGemCalculator(
                        context, 'Brilliant Marquise Cut'),
                  ),
                  ListTile(
                    title: const Text('Cushion Cut'),
                    onTap: () =>
                        navigateToGemCalculator(context, 'Cushion Cut'),
                  ),
                  ListTile(
                    title: const Text('Pear Cut'),
                    onTap: () => navigateToGemCalculator(context, 'Pear Cut'),
                  ),
                  ListTile(
                    title: const Text('Brilliant Oval Cut'),
                    onTap: () =>
                        navigateToGemCalculator(context, 'Brilliant Oval Cut'),
                  ),
                  ListTile(
                    title: const Text('Standard Brilliant Cut'),
                    onTap: () => navigateToGemCalculator(
                        context, 'Standard Brilliant Cut'),
                  ),
                  ListTile(
                    title: const Text('Princess Cut'),
                    onTap: () =>
                        navigateToGemCalculator(context, 'Princess Cut'),
                  ),
                  ListTile(
                    title: const Text('Trillion Cut'),
                    onTap: () =>
                        navigateToGemCalculator(context, 'Trillion Cut'),
                  )

                  // Add more ListTile widgets for each gem cut type
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
