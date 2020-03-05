import 'package:flutter/material.dart';
import 'package:health_board_app/model/precaution_model.dart';
import 'package:health_board_app/repository/precaution/precaution.dart';
import 'package:health_board_app/ui/widgets/dashboard_precaution_card_widget.dart';
import 'package:health_board_app/ui/widgets/precaution_card_widget.dart';
import 'package:health_board_app/ui/widgets/profile_widget.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProfileWidget(),
            SizedBox(
              height: 24,
            ),
            Text("Latest news"),
            Text("Precatuions"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: FutureBuilder(
                future: precautionRepository.getPrecautions(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<PrecautionModel> data = snapshot.data;
                  if (data == null) {
                    return Center(
                      child: Text("No Precautions"),
                    );
                  } else
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          data.length,
                          (index) => AspectRatio(
                              aspectRatio: 1,
                              child:
                                  DashboardPrecautionCardWidget(data[index]))),
                    );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
