import 'package:flutter/material.dart';
import 'package:health_board_app/model/note_model.dart';
import 'package:health_board_app/model/precaution_model.dart';
import 'package:health_board_app/model/precaution_stage.dart';
import 'package:health_board_app/widgets/precaution_card_widget.dart';

class BoardScreen extends StatefulWidget {
  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<PrecautionModel> precautions;

  @override
  void initState() {
    super.initState();
    precautions = List();
    precautions.add(PrecautionModel("Wash your hands frequently",
        "Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands."));
    precautions.add(PrecautionModel("Wash your hands frequently",
        "Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.",
        note: Note(
          "Did this with brother",
        ),
        stage: PrecautionStage("Done", color: Colors.green, index: 2)));
    precautions.add(PrecautionModel("Wash your hands frequently",
        "Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands."));
    precautions.add(PrecautionModel("Wash your hands frequently",
        "Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands."));
    precautions.add(PrecautionModel("Wash your hands frequently",
        "Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands."));
    precautions.add(PrecautionModel("Wash your hands frequently",
        "Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands."));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            print(constraints);
            return GridView.count(
              crossAxisCount: constraints.maxWidth ~/ 350,
              mainAxisSpacing: 24,
              children: List<Widget>.generate(precautions.length,
                  (index) => PrecautionCardWidget(precautions[index])),
            );
          },
        ),
      ),
    );
  }
}
