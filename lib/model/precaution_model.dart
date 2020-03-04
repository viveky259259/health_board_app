import 'package:health_board_app/model/precaution_stage.dart';

import 'note_model.dart';

class PrecautionModel {
  String title;
  String description;
  Note note;
  PrecautionStage stage;
  double created;

  PrecautionModel(this.title, this.description,
      {this.note, this.stage, this.created});
}
