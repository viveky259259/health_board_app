import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_board_app/model/color_style_model.dart';
import 'package:health_board_app/model/note_model.dart';
import 'package:health_board_app/model/precaution_model.dart';
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
            decoration: BoxDecoration(color: colorStyleModel.bgColor),
            child: Text(
              widget.model.title,
              textAlign: TextAlign.center,
              style: commonTextStyles.getMediumTextStyle(
                  color: colorStyleModel.textColor),
            ),
          ),
          Divider(),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                widget.model.description,
                style: commonTextStyles.getNormalTextStyle(),
              ),
            ),
          ),
          Divider(),
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
                    child: widget.model.note == null
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
                      child: TextField(
                        controller: _noteController,
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
