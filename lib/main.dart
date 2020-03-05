import 'package:flutter/material.dart';
import 'package:health_board_app/ui/board/board_screen.dart';
import 'package:health_board_app/ui/dashboard/dashboard_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashBoardScreen(),
    );
  }
}
