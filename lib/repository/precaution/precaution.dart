import 'package:flutter/material.dart';
import 'package:health_board_app/model/note_model.dart';
import 'package:health_board_app/model/precaution_model.dart';
import 'package:health_board_app/model/precaution_stage.dart';

class PrecautionRepository {
  Future<List<PrecautionModel>> getPrecautions() async {
    await Future.delayed(Duration(seconds: 2));
    List<PrecautionModel> precautions = List();
    precautions.add(PrecautionModel("Wash your hands frequently",
        "Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands."));
    precautions.add(PrecautionModel("Wash your hands frequently",
        "Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water. \nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.",
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
    return precautions;
  }
}

PrecautionRepository precautionRepository = PrecautionRepository();
