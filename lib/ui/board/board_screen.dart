import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_board_app/model/note_model.dart';
import 'package:health_board_app/model/precaution_model.dart';
import 'package:health_board_app/model/precaution_stage.dart';
import 'package:health_board_app/repository/precaution/precaution.dart';
import 'package:health_board_app/ui/widgets/precaution_card_recongnizer_widget.dart';

class BoardScreen extends StatefulWidget {
  @override
  _BoardScreenState createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<PrecautionModel> precautions;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      updatePrecautions();
    });
  }

  void updatePrecautions() async {
    precautions = await precautionRepository.getPrecautions();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            padding: EdgeInsets.all(16),
            child: LayoutBuilder(builder: (context, constraints) {
              print(constraints);
              if (loading)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else if (precautions == null)
                return Center(
                  child: Text(
                      "No precautions available! We will update soon. Stay tunes"),
                );
              return GridView.count(
                crossAxisCount: constraints.maxWidth ~/ 350,
                mainAxisSpacing: 24,
                children: List<Widget>.generate(
                  precautions.length,
                  (index) => PrecautionCardRecongnizer(precautions[index]),
                ),
              );
            })));
  }
}
