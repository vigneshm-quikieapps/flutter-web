import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/model/extractresponse.dart';
import 'package:flutter_web_dashboard/pages/drivers/driver_details.dart';
import 'package:flutter_web_dashboard/pages/drivers/widgets/driver_details.dart';
import 'package:flutter_web_dashboard/services/fetchservices.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:http/http.dart' as http;

/// Example without datasource
class DriversTable extends StatefulWidget {
  @override
  _DriversTableState createState() => _DriversTableState();
}

class _DriversTableState extends State<DriversTable> {
  List<dynamic> leaguelist = [];
  bool _progressVisible = false;

  fetchCoinInfo() async {
    setState(() {
      _progressVisible = true;
    });
    try {
      final response = await http.get(
        Uri.parse('https://www.thesportsdb.com/api/v1/json/1/all_leagues.php'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var v = json.decode(response.body);
        setState(() {
          leaguelist = v['leagues'];
        });
      } else {
        throw Exception('Failed to load album');
      }
      setState(() {
        _progressVisible = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchCoinInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _progressVisible
        ? Center(
            child: Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.black),
                strokeWidth: 2,
              ),
            ),
          )
        : Container(
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
                    label: Text("Sport"),
                    size: ColumnSize.L,
                  ),
                  DataColumn(
                    label: Text('Leagues'),
                  ),
                  DataColumn(
                    label: Text('Rating'),
                  ),
                  DataColumn(
                    label: Text('Details'),
                  ),
                ],
                rows: List<DataRow>.generate(
                    leaguelist.length,
                    (index) => DataRow(cells: [
                          DataCell(CustomText(text:leaguelist[index]['strSport'])),
                          DataCell(CustomText(text: leaguelist[index]['strLeague'])),
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
                          DataCell(
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DriversDetailsPage(
                                  id: leaguelist[index]['idLeague'],
                                )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: light,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: active, width: .5),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                child: CustomText(
                                  text: "Info",
                                  color: active.withOpacity(.7),
                                  weight: FontWeight.bold,
                                )),
                            )),
                        ]))),
          );
  }
}
