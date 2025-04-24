import 'dart:math';

import 'package:flutter/material.dart';

abstract class ColorGenerator {
  List<Color> generate({required int steps});
}

class RandomColorGenerator extends ColorGenerator {
  Color _getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255, // Fully opaque
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  List<Color> generate({required int steps}) {
    return List.generate(steps, (index) => _getRandomColor());
  }
}

class LinearWhiteToBlack extends ColorGenerator {
  @override
  List<Color> generate({required int steps}) {
    return List.generate(steps, (i) {
      final t = i / (steps - 1);
      return Color.lerp(Colors.white, Colors.black, t)!;
    });
  }
}
