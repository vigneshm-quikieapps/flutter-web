import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/pages/drivers/driver_details.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:http/http.dart' as http;


class DriverDetails extends StatefulWidget {
  final String id;
  // ignore: non_constant_identifier_names
  DriverDetails({
    this.id
  });

  @override
  _DriverDetailsState createState() => _DriverDetailsState();
}

class _DriverDetailsState extends State<DriverDetails> {
 List<dynamic> teamslist = [];
  bool _progressVisible = false;

  fetchLeagueDetails() async {
    setState(() {
      _progressVisible = true;
    });
    try {
      final response = await http.get(
        Uri.parse('https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=${widget.id}'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          teamslist = data['teams'];
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
    fetchLeagueDetails();
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
                    label: Text("Name"),
                    size: ColumnSize.L,
                  ),
                  DataColumn(
                    label: Text('Team Name'),
                  ),
                  DataColumn(
                    label: Text('Formed Year'),
                  ),
                  DataColumn(
                    label: Text('League 1'),
                  ),
                  DataColumn(
                    label: Text('League 2'),
                  ),
                ],
                rows: List<DataRow>.generate(
                    teamslist.length,
                    (index) => DataRow(cells: [
                          DataCell(Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: Image.network(teamslist[index]['strTeamLogo']??''),
                          )),
                          DataCell(CustomText(text: teamslist[index]['strTeam']??'null')),
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
                                text:  teamslist[index]['intFormedYear']??'null',
                              )
                            ],
                          )),
                          DataCell(CustomText(text: teamslist[index]['strLeague2']??'null')),
                          DataCell(CustomText(text: teamslist[index]['strLeague3']??'nul ')),
                        ]))),
          );
  }
}
