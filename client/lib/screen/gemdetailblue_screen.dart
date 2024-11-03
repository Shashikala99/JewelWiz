import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:jewelwiz/screen/GemstoneCameraScreen.dart';

class GemDetailsPage extends StatefulWidget {
  final String gemName;
  final String gemImage;
  final String mineralGroup;
  final String chemicalComposition;
  final String crystalSystem;
  final String refractiveIndex;
  final String specificGravity;
  final String hardness;
  final String luster;
  final String fracture;
  final String cleavage;
  final String pleochroism;

  const GemDetailsPage({
    super.key,
    required this.gemName,
    required this.gemImage,
    required this.mineralGroup,
    required this.chemicalComposition,
    required this.crystalSystem,
    required this.refractiveIndex,
    required this.specificGravity,
    required this.hardness,
    required this.luster,
    required this.fracture,
    required this.cleavage,
    required this.pleochroism,
  });

  @override
  _GemDetailsPageState createState() => _GemDetailsPageState();
}

class _GemDetailsPageState extends State<GemDetailsPage> {
  Future<void> openCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(camera: firstCamera),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gemName),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(widget.gemImage),
            Text('Mineral Group: ${widget.mineralGroup}'),
            Text('Chemical Composition: ${widget.chemicalComposition}'),
            Text('Crystal System: ${widget.crystalSystem}'),
            Text('Refractive Index: ${widget.refractiveIndex}'),
            Text('Specific Gravity: ${widget.specificGravity}'),
            Text('Hardness: ${widget.hardness}'),
            Text('Luster: ${widget.luster}'),
            Text('Fracture: ${widget.fracture}'),
            Text('Cleavage: ${widget.cleavage}'),
            Text('Pleochroism: ${widget.pleochroism}'),
            const SizedBox(height: 20),
            IconButton(
              icon: const Icon(Icons.camera_alt),
              iconSize: 50,
              onPressed: openCamera,
              tooltip: 'Open Camera',
            ),
          ],
        ),
      ),
    );
  }
}
