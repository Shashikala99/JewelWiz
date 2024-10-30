class GemCalculator {
  final double specificGravity;

  // Constructor with specific gravity
  GemCalculator({required this.specificGravity});

  // Gem cut properties as a map for each cut type
  static const Map<String, Map<String, double>> gemCuts = {
    'Blue Sapphire': {
      'L/W': 1.0,
      'T/W': 0.565,
      'U/W': 0.565,
      'P/W': 0.435,
      'C/W': 0.136,
      'Vol/W³': 0.198,
    },
    'Brilliant Heart': {
      'L/W': 1.011,
      'T/W': 0.544,
      'U/W': 0.505,
      'P/W': 0.486,
      'C/W': 0.188,
      'Vol/W³': 0.233,
    },
    'Brilliant Marquise': {
      'L/W': 2.414,
      'T/W': 1.289,
      'U/W': 0.5,
      'P/W': 0.845,
      'C/W': 0.296,
      'Vol/W³': 0.827,
    },
    'Brilliant Oval': {
      'L/W': 1.267,
      'T/W': 0.693,
      'U/W': 0.482,
      'P/W': 0.483,
      'C/W': 0.201,
      'Vol/W³': 0.323,
    },
    'Cushion': {
      'L/W': 1.0,
      'T/W': 0.551,
      'U/W': 0.551,
      'P/W': 0.556,
      'C/W': 0.159,
      'Vol/W³': 0.298,
    },
    'Pear': {
      'L/W': 1.495,
      'T/W': 0.718,
      'U/W': 0.504,
      'P/W': 0.615,
      'C/W': 0.26,
      'Vol/W³': 0.444,
    },
    'Trillion': {
      'L/W': 1.089,
      'T/W': 0.582,
      'U/W': 0.544,
      'P/W': 0.418,
      'C/W': 0.11,
      'Vol/W³': 0.175,
    },
    'Princess Cut': {
      'L/W': 1.0,
      'T/W': 0.66,
      'U/W': 0.53,
      'P/W': 0.57,
      'C/W': 0.15,
      'Vol/W³': 0.29,
    },
  };

  // Method to calculate volume and weight based on gem cut type
  Map<String, double> calculateGemWeight(String gemCut, double width) {
    if (!gemCuts.containsKey(gemCut)) {
      throw ArgumentError('Invalid gem cut type');
    }

    // Retrieve properties for the selected gem cut
    final properties = gemCuts[gemCut]!;

    double volume = properties['Vol/W³']! * width * width * width;
    double weight = volume * specificGravity;

    // Return calculated properties
    return {
      'width': width,
      'volume': volume,
      'weight': weight,
    };
  }
}

void main() {
  double gemWidth = 10.0; // Width of the gem in cm
  double specificGravity = 3.52; // Specific gravity of the gemstone
  String selectedCut = 'Brilliant Heart'; // Selected gem cut

  GemCalculator calculator = GemCalculator(specificGravity: specificGravity);
  Map<String, double> gemProperties =
      calculator.calculateGemWeight(selectedCut, gemWidth);

  // Output the calculated properties
  print("Gem Properties for $selectedCut:");
  print("Width: ${gemProperties['width']} cm");
  print("Volume: ${gemProperties['volume']} cm³");
  print("Weight: ${gemProperties['weight']} g");
}
