import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_board_app/model/color_style_model.dart';
import 'package:health_board_app/model/note_model.dart';
import 'package:health_board_app/model/precaution_model.dart';
import 'package:health_board_app/model/precaution_stage.dart';
import 'package:health_board_app/statics/common_text_styles.dart';

class PrecautionCardWidget extends StatefulWidget {
  final PrecautionModel model;

  PrecautionCardWidget(this.model);

  @override
  _PrecautionCardWidgetState createState() => _PrecautionCardWidgetState();
}

class _PrecautionCardWidgetState extends State<PrecautionCardWidget> {
  bool _isEditingNote;
  TextEditingController _noteController;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _isEditingNote = false;
    _noteController = TextEditingController()
      ..text = widget.model.note?.note ?? "";
  }

  @override
  Widget build(BuildContext context) {
    ColorStyleModel colorStyleModel = ColorStyleModel.getColorsByIndex(
        widget.model.stage == null ? 0 : widget.model.stage.index);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: colorStyleModel.bgColor,
                border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).dividerColor, width: 2))),
            child: Text(
              widget.model.title,
              textAlign: TextAlign.center,
              style: commonTextStyles.getMediumTextStyle(
                  color: colorStyleModel.textColor),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                widget.model.description,
//                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: commonTextStyles.getNormalTextStyle(),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Opacity(
                opacity:
                    (widget.model.stage != null && widget.model.stage.index > 0)
                        ? 1
                        : 0.3,
                child: IconButton(
                  tooltip: "No action",
                  icon: Icon(
                    Icons.play_circle_outline,
                    size: 20,
                  ),
                  onPressed: () {
                    widget.model.stage = PrecautionStage.getStageByIndex(0);
                    setState(() {});
                  },
                ),
              ),
              Opacity(
                opacity:
                    (widget.model.stage != null && widget.model.stage.index > 1)
                        ? 1
                        : 0.3,
                child: IconButton(
                  tooltip: "In progess",
                  icon: Icon(
                    Icons.report_problem,
                    size: 20,
                  ),
                  onPressed: () {
                    widget.model.stage = PrecautionStage.getStageByIndex(1);
                    setState(() {});
                  },
                ),
              ),
              Opacity(
                opacity:
                    (widget.model.stage != null && widget.model.stage.index > 2)
                        ? 1
                        : 0.3,
                child: IconButton(
                  tooltip: "Done",
                  icon: Icon(
                    Icons.done,
                    size: 20,
                  ),
                  onPressed: () {
                    widget.model.stage = PrecautionStage.getStageByIndex(2);
                    setState(() {});
                  },
                ),
              ),
              Opacity(
                opacity:
                    (widget.model.stage != null && widget.model.stage.index > 3)
                        ? 1
                        : 0.3,
                child: IconButton(
                  tooltip: "Facing problems",
                  icon: Icon(
                    Icons.close,
                    size: 20,
                  ),
                  onPressed: () {
                    widget.model.stage = PrecautionStage.getStageByIndex(3);
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: Theme.of(context).dividerColor,
          ),
          !_isEditingNote
              ? GestureDetector(
                  onTap: () {
                    _isEditingNote = !_isEditingNote;
                    setState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white),
                    child: widget.model.note == null ||
                            widget.model.note.note.trim().length == 0
                        ? Text(
                            "Add Note",
                            textAlign: TextAlign.center,
                            style: commonTextStyles.getNormalTextStyle(),
                          )
                        : Text(
                            widget.model.note.note,
                            textAlign: TextAlign.center,
                            style: commonTextStyles.getNormalTextStyle(),
                          ),
                  ),
                )
              : Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          focusNode: _focusNode,
                          controller: _noteController,
                          decoration:
                              InputDecoration(hintText: "Click to add note"),
                        ),
                      ),
                    ),
                    FlatButton(
                      child: Text("Done"),
                      onPressed: () {
                        if (widget.model.note == null) {
                          widget.model.note = Note(_noteController.text);
                        } else
                          widget.model.note.note = _noteController.text;

                        _isEditingNote = !_isEditingNote;
                        FocusScope.of(context).requestFocus(_focusNode);
                        setState(() {});
                      },
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
