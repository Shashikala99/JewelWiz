class GemCalculator {
  final double specificGravity;

  // Constructor with specific gravity
  GemCalculator({required this.specificGravity});

  // Gem cut properties as a map for each cut type
  static const Map<String, Map<String, double>> gemCuts = {
    // Your existing gem cuts...
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
