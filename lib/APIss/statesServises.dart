// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:covid_tracker/APIss/apiUrl.dart';
import '../Modelss/worldstateModel.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  // this is for all world data
  Future<WoldStateApiModel> fatchworldstateRecord() async {
    final reponse = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (reponse.statusCode == 200) {
      var data = jsonDecode(reponse.body);
      return WoldStateApiModel.fromJson(data);
    } else {
      throw Exception("Some thing Wrong");
    }
  }

  // this if for country Api
  Future<List<dynamic>> fatchworldCountryRecord() async {
    final reponse = await http.get(Uri.parse(AppUrl.countriesList));
    var data;
    if (reponse.statusCode == 200) {
      data = jsonDecode(reponse.body);
      return data;
    } else {
      throw Exception("Some thing Wrong");
    }
  }
}
