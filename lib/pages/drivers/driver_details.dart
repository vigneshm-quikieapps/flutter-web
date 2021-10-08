import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/drivers/widgets/driver_details.dart';
import 'package:flutter_web_dashboard/pages/drivers/widgets/drivers_table.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

class DriversDetailsPage extends StatefulWidget {
  final String id;
  const DriversDetailsPage({
    this.id
  });

  @override
  _DriversDetailsPageState createState() => _DriversDetailsPageState();
}

class _DriversDetailsPageState extends State<DriversDetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
           Row(
              children: [
                Container(
                    margin: EdgeInsets.only(top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: 'League Details',
                      size: 24,
                      weight: FontWeight.bold,
                    )),
              ],
            ),
          Expanded(
              child: ListView(
            children: [DriverDetails(
              id: widget.id,
            )],
          )),
        ],
      ),
    );
  }
}
