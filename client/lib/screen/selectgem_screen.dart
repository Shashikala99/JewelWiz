import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jewelwiz/screen/gemdetailblue_screen.dart';

class SelectGemScreen extends StatefulWidget {
  const SelectGemScreen({super.key});

  @override
  _SelectGemScreenState createState() => _SelectGemScreenState();
}

class _SelectGemScreenState extends State<SelectGemScreen> {
  String? _selectedGem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Gem'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: const Text('Select Your Gem'),
              value: _selectedGem,
              onChanged: (newValue) {
                setState(() {
                  _selectedGem = newValue;
                });
                if (_selectedGem == 'Blue Sapphire') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GemDetailsPage(
                        gemName: 'Blue Sapphire',
                        gemImage:
                            'assets/bluesapphire.jpg', // path to Blue Sapphire image
                        mineralGroup: 'Corundum',
                        chemicalComposition: 'Al₂O₃',
                        crystalSystem: 'Hexagonal',
                        refractiveIndex: '1.76 - 1.77',
                        specificGravity: '4.00',
                        hardness: '9',
                        luster: 'Vitreous',
                        fracture: 'Conchoidal',
                        cleavage: 'None',
                        pleochroism: 'Strong',
                      ),
                    ),
                  );
                }
                if (_selectedGem == 'Beryl') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GemDetailsPage(
                        gemName: 'Beryl',
                        gemImage:
                            'assets/Beryl.png', // path to Blue Sapphire image
                        mineralGroup: 'Corundum Variety',
                        chemicalComposition: 'Be₃Al₂(SiO₄)₃',
                        crystalSystem: 'Hexagonal',
                        refractiveIndex: '1.56 - 1.59',
                        specificGravity: '2.7-2.8',
                        hardness: '7.5-8.00',
                        luster: 'Vitreous',
                        fracture: 'Conchoidal to even',
                        cleavage: 'Imperfection Sometime',
                        pleochroism: 'Medium to Weak',
                      ),
                    ),
                  );
                }
                if (_selectedGem == 'Topaz') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GemDetailsPage(
                        gemName: 'Topaz',
                        gemImage:
                            'assets/topaz.png', // path to Blue Sapphire image
                        mineralGroup: 'Nesosilicate',
                        chemicalComposition: 'Al₂SiO₄(F, OH)₂',
                        crystalSystem: 'Orthorhombic',
                        refractiveIndex: '1.61–1.62',
                        specificGravity: '3.49–3.57',
                        hardness: '8.00',
                        luster: 'Vitreous',
                        fracture: 'Sub-conchoidal to uneven',
                        cleavage: 'Perfect, basal plane',
                        pleochroism: 'Medium to Weak',
                      ),
                    ),
                  );
                }
                if (_selectedGem == 'Taaffeite') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GemDetailsPage(
                        gemName: 'Taaffeite',
                        gemImage: 'assets/Taaffiet.PNG',
                        mineralGroup: 'Nesosilicate',
                        chemicalComposition: 'XY₃Z₆(T₆O₁₈)(BO₃)₃V₃W',
                        crystalSystem: 'Trigonal',
                        refractiveIndex: '1.61–1.66',
                        specificGravity: '3.01–3.12',
                        hardness: '7-7.5',
                        luster: 'Vitreous',
                        fracture: 'Conchoidal',
                        cleavage: 'Imperfect/fair/absent',
                        pleochroism: 'Weak',
                      ),
                    ),
                  );
                }
                if (_selectedGem == 'Tourmaline') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GemDetailsPage(
                        gemName: 'Tourmaline',
                        gemImage:
                            'assets/Tourmalin.PNG', // path to Blue Sapphire image
                        mineralGroup: 'Crystalline silicate mineral',
                        chemicalComposition: 'BeMg3Al8O16',
                        crystalSystem: ' Hexagonal',
                        refractiveIndex: '1.70–1.73',
                        specificGravity: '3.6',
                        hardness: '7-7.5',
                        luster: 'Vitreous',
                        fracture: 'Conchoidal to uneven',
                        cleavage: 'Poor',
                        pleochroism: 'Strongly Pleochroic',
                      ),
                    ),
                  );
                }
                if (_selectedGem == 'Spinal') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GemDetailsPage(
                        gemName: 'Spinal',
                        gemImage: 'assets/Spinal.PNG',
                        mineralGroup: 'Oxide',
                        chemicalComposition: 'MgAl₂O₄',
                        crystalSystem: ' Cubic',
                        refractiveIndex: '1.71–1.72',
                        specificGravity: '3.6',
                        hardness: '8',
                        luster: 'Vitreous',
                        fracture: 'Conchoidal to uneven',
                        cleavage: 'None',
                        pleochroism: 'Absent',
                      ),
                    ),
                  );
                }
                if (_selectedGem == 'Chrysoberyl') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GemDetailsPage(
                        gemName: 'Chrysoberyl',
                        gemImage:
                            'assets/chrysoberyl.PNG', // path to Blue Sapphire image
                        mineralGroup: 'Oxide Minerals',
                        chemicalComposition: ' BeAl2O4',
                        crystalSystem: ' Orthorhombic',
                        refractiveIndex: '1.74–1.77',
                        specificGravity: '3.72',
                        hardness: '8.5',
                        luster: 'Vitreous',
                        fracture: 'Conchoidal to uneven',
                        cleavage: 'Distinct',
                        pleochroism: ' Strong pleochroism',
                      ),
                    ),
                  );
                }
                if (_selectedGem == 'Garnet') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GemDetailsPage(
                        gemName: 'Garnet',
                        gemImage:
                            'assets/Garnet.PNG', // path to Blue Sapphire image
                        mineralGroup: ' Nesosilicate',
                        chemicalComposition: 'X3Y2(SiO4)3',
                        crystalSystem: ' Isometric',
                        refractiveIndex: '1.72–1.94',
                        specificGravity: '3.1-4.3',
                        hardness: '6.5-7.5',
                        luster: 'Vitreous to  Resinous',
                        fracture: 'Conchoidal to uneven',
                        cleavage: 'Absent',
                        pleochroism: 'None',
                      ),
                    ),
                  );
                }
                if (_selectedGem == 'Zircon') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GemDetailsPage(
                        gemName: 'Zircon',
                        gemImage:
                            'assets/zircon.PNG', // path to Blue Sapphire image
                        mineralGroup: ' Nesosilicate',
                        chemicalComposition: 'ZrSiO4',
                        crystalSystem: ' Tetragonal',
                        refractiveIndex: '1.78-1.9, 1.92-1.98 , 1.87-1.9',
                        specificGravity: '4.2-4.86',
                        hardness: '7.5',
                        luster: 'Vitreous to adamantine',
                        fracture: 'Conchoidal to uneven',
                        cleavage: 'Poor',
                        pleochroism: 'Weak',
                      ),
                    ),
                  );
                }
              },
              items: const [
                DropdownMenuItem<String>(
                  value: 'Blue Sapphire',
                  child: Text('Blue Sapphire'),
                ),
                DropdownMenuItem<String>(
                  value: 'Topaz',
                  child: Text('Topaz'),
                ),
                DropdownMenuItem<String>(
                  value: 'Taaffeite',
                  child: Text('Taaffeite'),
                ),
                DropdownMenuItem<String>(
                  value: 'Tourmaline',
                  child: Text('Tourmaline'),
                ),
                DropdownMenuItem<String>(
                  value: 'Spinal',
                  child: Text('Spinal'),
                ),
                DropdownMenuItem<String>(
                  value: 'Chrysoberyl',
                  child: Text('Chrysoberyl'),
                ),
                DropdownMenuItem<String>(
                  value: 'Garnet',
                  child: Text('Garnet'),
                ),
                DropdownMenuItem<String>(
                  value: 'Beryl',
                  child: Text('Beryl'),
                ),
                DropdownMenuItem<String>(
                  value: 'Zircon',
                  child: Text('Zircon'),
                ),
                // Other gems here...
              ],
            ),
          ],
        ),
      ),
    );
  }
}
