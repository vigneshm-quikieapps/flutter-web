import 'dart:convert';

import 'package:flutter_web_dashboard/model/extractresponse.dart';
import 'package:http/http.dart' as http;

Future<ExtractResponse> fetchCoinInfo() async {
  final response = await http.get(
    Uri.parse('https://cors-anywhere.herokuapp.com/https://pro-api.coinmarketcap.com/v1/cryptocurrency/map'),
    headers: <String, String>{
      'X-CMC_PRO_API_KEY': '2592e201-7cb0-41b4-81d5-abacc60ac4ee',
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  );
  if (response.statusCode == 200) {
    print('jaanu ${response.body}');
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // return ExtractResponse.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

// Future<ExtractImageResponse> fetchCoinInfoImage(String id) async {
//   final response = await http.get(
//     Uri.parse('https://pro-api.coinmarketcap.com/v1/cryptocurrency/info?id=$id'),
//     headers: <String, String>{
//       'X-CMC_PRO_API_KEY': '2592e201-7cb0-41b4-81d5-abacc60ac4ee',
//       "Accept": "application/json",
//     },
//   );
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return ExtractImageResponse.fromJson(jsonDecode(response.body),id);
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
//}