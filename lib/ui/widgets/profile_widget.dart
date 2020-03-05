import 'package:flutter/material.dart';
import 'package:health_board_app/model/user_model.dart';
import 'package:health_board_app/statics/common_text_styles.dart';

class ProfileWidget extends StatelessWidget {
  final UserModel userModel = UserModel("Vivek", 24, false);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      text: "Hey",
                      children: [
                        TextSpan(text: '   '),
                        TextSpan(
                            text: userModel.name,
                            style: commonTextStyles.getMediumTextStyle())
                      ],
                      style: commonTextStyles.getNormalTextStyle()),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("Log out"),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text("Let's fight Covid'19 (Corona Virus)")
          ],
        ),
      ),
    );
  }
}
