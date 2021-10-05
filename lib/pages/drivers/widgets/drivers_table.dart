import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/model/extractresponse.dart';
import 'package:flutter_web_dashboard/services/fetchservices.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:http/http.dart' as http;

/// Example without datasource
class DriversTable extends StatefulWidget {
  @override
  _DriversTableState createState() => _DriversTableState();
}

class _DriversTableState extends State<DriversTable> {
  // Future<ExtractResponse> _futureResponse;
//   fetchCoinInfo() async {
//   final response = await http.get(
//     Uri.parse('https://pro-api.coinmarketcap.com/v1/cryptocurrency/map'),
//     headers: <String, String>{
//       'X-CMC_PRO_API_KEY': '2592e201-7cb0-41b4-81d5-abacc60ac4ee',
//       "Accept": "application/json",
//       "Access-Control-Allow-Origin": "*",
//     },
//   );
//   print(response.statusCode);
//   if (response.statusCode == 200) {
//     var v = json.decode(response.body);
//     print(v);
//     print('jaanu ${response.body}');
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//    // return ExtractResponse.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
  @override
  void initState() {
    // fetchCoinInfo();
    super.initState();
    // setState(() {
    //   _futureResponse = fetchCoinInfo();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [BoxShadow(offset: Offset(0, 6), color: lightGrey.withOpacity(.1), blurRadius: 12)],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 30),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: [
            DataColumn2(
              label: Text("Name"),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: Text('Location'),
            ),
            DataColumn(
              label: Text('Rating'),
            ),
            DataColumn(
              label: Text('Action'),
            ),
          ],
          rows: List<DataRow>.generate(
              15,
              (index) => DataRow(cells: [
                    DataCell(CustomText(text: "Santos Enoque")),
                    DataCell(CustomText(text: "New yourk city")),
                    DataCell(Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.deepOrange,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText(
                          text: "4.5",
                        )
                      ],
                    )),
                    DataCell(Container(
                        decoration: BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: active, width: .5),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: CustomText(
                          text: "Block",
                          color: active.withOpacity(.7),
                          weight: FontWeight.bold,
                        ))),
                  ]))),
    );
  }
}
