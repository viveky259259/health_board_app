import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_board_app/model/precaution_model.dart';
import 'package:health_board_app/ui/widgets/precaution_card_widget.dart';

class PrecautionCardRecongnizer extends StatefulWidget {
  final PrecautionModel model;

  PrecautionCardRecongnizer(this.model);

  @override
  _PrecautionCardRecongnizerState createState() =>
      _PrecautionCardRecongnizerState();
}

class _PrecautionCardRecongnizerState extends State<PrecautionCardRecongnizer> {
  @override
  Widget build(BuildContext context) {
    Widget baseWidget = PrecautionCardWidget(widget.model);

    return GestureDetector(
        child: baseWidget,
        onTap: () async {
          await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Stack(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16),
                            child: baseWidget,
                          ),
                          Positioned(
                            right: 16,
                            top: 16,
                            child: IconButton(
                              tooltip: "Close",
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.clear),
                            ),
                          )
                        ])),
                  ));

          setState(() {});
        });
  }
}
