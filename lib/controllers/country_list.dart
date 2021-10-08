import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CountryList extends ChangeNotifier{



    var countrylist;
  fetchCoinInfo() async {
    try {
      final response = await http.get(
        Uri.parse('https://www.thesportsdb.com/api/v1/json/1/all_countries.php'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
         countrylist = [];
    countrylist = res['countries'];
         print('ja${countrylist[0]['name_en']}');
          
      } else {
        throw Exception('Failed to load Country');
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

}