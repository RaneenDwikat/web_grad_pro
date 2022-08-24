import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled3/worker/dashboardworker.dart';
import 'package:untitled3/worker/sidebar.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/manager/Home/order.dart';
import 'package:untitled3/manager/Home/workers.dart';
import 'package:untitled3/manager/Home/client.dart';
import 'package:untitled3/manager/Home/category.dart';

class Homescreenworker extends StatefulWidget {
  Homescreenworker(this.phonenumber);
  var phonenumber;
  @override
  _HomescreenworkerState createState() => _HomescreenworkerState(phonenumber);
}

class _HomescreenworkerState extends State<Homescreenworker> {
  var phonenumber;
  _HomescreenworkerState(this.phonenumber);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    return Scaffold(
      // now we make it more professional
      // remove all litsview widgets
      body: Row(
        children: [
          //menu

          Expanded(
              flex: 6,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Dashboardworker(
                            phonenumber,
                            // category: categor,
                            // service: service,
                          )),
                      if (!Responsive.isMobile(context))
                        Expanded(flex: 2, child: SideBarworker(phonenumber)),
                    ],
                  ),
                ],
              )),

          //sidebar
        ],
      ),
    );
  }
}
