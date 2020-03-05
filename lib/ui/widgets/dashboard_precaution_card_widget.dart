import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_board_app/model/color_style_model.dart';
import 'package:health_board_app/model/note_model.dart';
import 'package:health_board_app/model/precaution_model.dart';
import 'package:health_board_app/model/precaution_stage.dart';
import 'package:health_board_app/statics/common_text_styles.dart';

class DashboardPrecautionCardWidget extends StatelessWidget {
  final PrecautionModel model;

  DashboardPrecautionCardWidget(this.model);

  @override
  Widget build(BuildContext context) {
    ColorStyleModel colorStyleModel = ColorStyleModel.getColorsByIndex(
        model.stage == null ? 0 : model.stage.index);
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
              model.title,
              textAlign: TextAlign.center,
              style: commonTextStyles.getMediumTextStyle(
                  color: colorStyleModel.textColor),
            ),
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: Theme.of(context).dividerColor,
          ),
          Text(
            model?.note?.note ?? "",
            textAlign: TextAlign.center,
            style: commonTextStyles.getNormalTextStyle(),
          )
        ],
      ),
    );
  }
}
