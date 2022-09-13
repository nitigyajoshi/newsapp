import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
//import 'package:newsapp/const/Strings.gitignore';
//import 'package:newsapp/const/Strings.gitignore';
import 'package:newsapp/const/const.gitignore';
import 'package:newsapp/model/model.dart';

// ignore: camel_case_types
class API_Manager with ChangeNotifier{
  Future<Welcome> getNews() async {
    var client = http.Client();
    var newsModel;
var today;
    try {
      
     var response =   await http.get(Uri.parse(Strings.news_url));
    //  var response = await client.get(Strings.news_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = Welcome.fromJson(jsonMap);
       // print('newsmodel...');
       // print(newsModel);
      }
    } catch (Exception) {
      return newsModel;
    }
    notifyListeners();

    return newsModel;
  }
}