import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'gemcalculator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CapturedGemScreen extends StatefulWidget {
  final Uint8List imageBytes;
  final double specificGravity;

  const CapturedGemScreen({
    super.key,
    required this.imageBytes,
    required this.specificGravity,
  });

  @override
  _CapturedGemScreenState createState() => _CapturedGemScreenState();
}

class _CapturedGemScreenState extends State<CapturedGemScreen> {
  double? width;
  double? height;
  bool isLoading = false;

  Future<void> fetchAndDisplayMeasurements() async {
    setState(() {
      isLoading = true; // Show loading indicator while fetching
    });

    try {
      final measurements = await fetchGemMeasurements();
      setState(() {
        width = measurements['width'];
        height = measurements['height'];
      });
    } catch (e) {
      print('Error fetching measurements: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error fetching gem measurements')),
      );
    } finally {
      setState(() {
        isLoading = false; // Hide loading indicator
      });
    }
  }

  Future<Map<String, double>> fetchGemMeasurements() async {
    const url =
        'http://192.168.247.185:5000/measure'; // Update with your Flask server URL

    try {
      // Send the image to the Flask API
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/octet-stream'},
        body: widget.imageBytes,
      );

      if (response.statusCode == 200) {
        // Decode and parse the response JSON
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        return {
          'width': (jsonResponse['width'] as num).toDouble(),
          'height': (jsonResponse['height'] as num).toDouble(),
        };
      } else {
        print('Error from server: ${response.body}');
        return {'width': 2.5, 'height': 1.8}; // Fallback values
      }
    } catch (e) {
      print('Error fetching measurements: $e');
      return {'width': 2.5, 'height': 1.8}; // Fallback values
    }
  }

  void navigateToGemCalculator(BuildContext context, String cutType) async {
    if (width == null || height == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fetch measurements first')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GemCalculator(
          cutType: cutType,
          specificGravity: widget.specificGravity,
          width: width!,
          height: height!,
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Image.memory(
                widget.imageBytes,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              // "Show Measurements" Button
              ElevatedButton(
                onPressed: isLoading ? null : fetchAndDisplayMeasurements,
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text("Show Measurements"),
              ),

              // Display Width and Height
              if (width != null && height != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Width: ${width!.toStringAsFixed(1)} cm, '
                    'Height: ${height!.toStringAsFixed(1)} cm',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

              const SizedBox(height: 20),
              const Text(
                'Select the Gem Cut Shape',
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
                      onTap: () => navigateToGemCalculator(
                          context, 'Brilliant Heart Cut'),
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
                      onTap: () => navigateToGemCalculator(
                          context, 'Brilliant Oval Cut'),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
