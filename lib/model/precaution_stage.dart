import 'package:flutter/material.dart' show Color, Colors;

class PrecautionStage {
  String name;
  int index;
  Color color;

  PrecautionStage(this.name, {this.index, this.color});

  static PrecautionStage getStageByIndex(int index) {
    switch (index) {
      case 0:
        return PrecautionStage("No action", color: Colors.white, index: 1);
      case 1:
        return PrecautionStage("In progress", color: Colors.yellow, index: 2);
      case 2:
        return PrecautionStage("Done", color: Colors.green, index: 3);
      case 3:
        return PrecautionStage("Problem occured", color: Colors.red, index: 4);
      default:
        return PrecautionStage("No action", color: Colors.white, index: 0);
    }
  }
}
