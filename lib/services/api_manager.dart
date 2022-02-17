import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:university_detail/Constant/constant.dart';
import 'package:university_detail/model/university_info.dart';

class API_Manager {
  Future<UniversityList> getlist() async {
    var client = http.Client();
    var UniversityModel;

    try {
      var response = await client.get(apiKey);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        UniversityModel = UniversityList.fromJson(jsonMap);
      }
    } catch (Exception) {
      return UniversityModel;
    }

    return UniversityModel;
  }
}