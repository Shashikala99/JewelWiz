import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:jewelwiz/screen/CapturedGemScree.dart';
import 'dart:io'; // Import for working with File
import 'package:jewelwiz/screen/captured_gem_screen.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({super.key, required this.camera});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _capturePhoto() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      final imageBytes = await image.readAsBytes();

      // Navigate to the new screen with the captured image bytes
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CapturedGemScreen(
            imageBytes: imageBytes,
          ),
        ),
      );
    } catch (e) {
      print('Error capturing photo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capture Gem Image'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                CameraPreview(_controller),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.camera),
                      iconSize: 50,
                      color: Colors.white,
                      onPressed: _capturePhoto,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
