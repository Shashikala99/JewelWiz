import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'gem_calculator.dart'; // Import your GemCalculator class

class CapturedGemScreen extends StatelessWidget {
  final Uint8List imageBytes; // Use imageBytes for in-memory image

  const CapturedGemScreen({super.key, required this.imageBytes});

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
              imageBytes, // Display the captured image from memory
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Brilliant Heart Cut'),
                  Text('Brilliant Marquise Cut'),
                  Text('Cushion Cut'),
                  Text('Standard Brilliant Cut'),
                  Text('Brilliant Oval Cut'),
                  Text('Pear Cut'),
                  Text('Trillion Cut'),
                  Text('Princess Cut'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
