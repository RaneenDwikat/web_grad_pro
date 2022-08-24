import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/manager/Home/Menu/menu.dart';
import 'package:untitled3/manager/Home/order.dart';
import 'package:untitled3/manager/Home/workers.dart';
import 'package:untitled3/manager/Home/client.dart';
import 'package:untitled3/manager/Home/category.dart';

import 'Sidebar/sidebar.dart';
import 'dashboard/dashboard.dart';

class Homescreen extends StatefulWidget {
  Homescreen(this.phonenumber);
  var phonenumber;
  @override
  _HomescreenState createState() => _HomescreenState(phonenumber);
}

class _HomescreenState extends State<Homescreen> {
  var phonenumber;
  _HomescreenState(this.phonenumber);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    return Scaffold(
      // now we make it more professional
      // remove all litsview widgets
      drawer: Menu(phonenumber),
      body: Row(
        children: [
          //menu

          if (Responsive.isDesktop(context))
            Expanded(flex: 1, child: Menu(phonenumber)),
          //main section
          Expanded(
              flex: 6,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Dashboard(
                            phonenumber: phonenumber,
                            // category: categor,
                            // service: service,
                          )),
                      if (!Responsive.isMobile(context))
                        Expanded(flex: 2, child: SideBar(phonenumber)),
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
