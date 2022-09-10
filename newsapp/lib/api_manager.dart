import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:newsapp/const/Strings.gitignore';
//import 'package:newsapp/const/Strings.gitignore';
import 'package:newsapp/const/const.gitignore';
import 'package:newsapp/model/model.dart';

// ignore: camel_case_types
class API_Manager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      
     var response =   await http.get(Uri.parse(Strings.news_url));
    //  var response = await client.get(Strings.news_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
print(jsonMap["articles"]);
        newsModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}