import 'package:flutter/material.dart';

class GemCalculator extends StatelessWidget {
  final String cutType;
  final double specificGravity;
  final double width; // Input rough gem width
  final double
      cuttingLoss; // Input percentage of cutting loss (e.g., 0.3 for 30%)

  const GemCalculator({
    super.key,
    required this.cutType,
    required this.specificGravity,
    required this.width,
    required this.cuttingLoss,
  })  : assert(specificGravity != null, 'specificGravity cannot be null'),
        assert(width != null, 'width cannot be null'),
        assert(cuttingLoss != null, 'cuttingLoss cannot be null');

  @override
  Widget build(BuildContext context) {
    // Step 1: Load specific values based on `cutType`
    final gemData = getGemData(cutType);

    // Step 2: Calculate final volume using Vol/W³ ratio
    double volume = (gemData['Vol/W³'] ?? 0.0) * (width * width * width);

    // Step 3: Predict final weight using volume and specific gravity
    double predictedWeight = volume * specificGravity;

    // Step 4: Calculate final weight considering cutting loss
    double finalWeight = predictedWeight * (1 - cuttingLoss);

    return Scaffold(
      appBar: AppBar(
        title: Text('$cutType - Gem Weight Prediction'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(gemData['imagePath'], width: 200, height: 200),
            const SizedBox(height: 20),
            Text(
              gemData['description'],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Predicted Final Weight: ${finalWeight.toStringAsFixed(2)} g',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> getGemData(String cutType) {
    switch (cutType) {
      case 'Brilliant Heart Cut':
        return {
          'Vol/W³': 0.198,
          'imagePath': 'assets/heart_cut.png',
          'description':
              'Heart Cut details: A popular cut shaped like a heart, often used for sentimental jewelry.',
        };
      case 'Brilliant Marquise Cut':
        return {
          'Vol/W³': 0.192,
          'imagePath': 'assets/marquise_cut.png',
          'description':
              'Marquise Cut details: An elongated shape with pointed ends, maximizing carat weight.',
        };
      case 'Cushion Cut':
        return {
          'Vol/W³': 0.205,
          'imagePath': 'assets/cushion_cut.png',
          'description':
              'Cushion Cut details: A square or rectangular shape with rounded edges, resembling a cushion.',
        };
      case 'Pear Cut':
        return {
          'Vol/W³': 0.195,
          'imagePath': 'assets/pear_cut.png',
          'description':
              'Pear Cut details: A unique cut combining the round and marquise shapes, teardrop-like in appearance.',
        };
      case 'Brilliant Oval Cut':
        return {
          'Vol/W³': 0.200,
          'imagePath': 'assets/oval_cut.png',
          'description':
              'Oval Cut details: An elongated round shape, creating an illusion of length on fingers.',
        };
      case 'Standard Brilliant Cut':
        return {
          'Vol/W³': 0.198,
          'imagePath': 'assets/standard_brilliant_cut.png',
          'description':
              'Standard Brilliant Cut details: The most popular diamond cut, optimized for maximum sparkle.',
        };
      case 'Princess Cut':
        return {
          'Vol/W³': 0.190,
          'imagePath': 'assets/princess_cut.png',
          'description':
              'Princess Cut details: A square cut that combines sharp edges with a brilliant-style faceting.',
        };
      case 'Trillion Cut':
        return {
          'Vol/W³': 0.185,
          'imagePath': 'assets/trillion_cut.png',
          'description':
              'Trillion Cut details: A triangular shape with curved or straight edges, often used as accent stones.',
        };
      // Add more cases if needed
      default:
        return {
          'Vol/W³': 0.198,
          'imagePath': 'assets/default_cut.png',
          'description':
              'Default cut description: A standard cut with typical properties.',
        };
    }
  }
}
