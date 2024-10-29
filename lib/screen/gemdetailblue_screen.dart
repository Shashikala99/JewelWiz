import 'package:flutter/material.dart';

class GemDetailsPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gemName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  gemImage,
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              _buildDescriptionTile('Mineral Group', mineralGroup),
              _buildDescriptionTile(
                  'Chemical Composition', chemicalComposition),
              _buildDescriptionTile('Crystal System', crystalSystem),
              _buildDescriptionTile('Refractive Index', refractiveIndex),
              _buildDescriptionTile('Specific Gravity', specificGravity),
              _buildDescriptionTile('Hardness', hardness),
              _buildDescriptionTile('Luster', luster),
              _buildDescriptionTile('Fracture', fracture),
              _buildDescriptionTile('Cleavage', cleavage),
              _buildDescriptionTile('Pleochroism', pleochroism),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionTile(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            '$title:',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(description),
          ),
        ],
      ),
    );
  }
}
