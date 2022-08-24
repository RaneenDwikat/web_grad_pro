import 'package:flutter/material.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/manager/Home/Tables/project_widget.dart';
import 'package:untitled3/manager/Home/Menu/menu.dart';
import 'package:untitled3/manager/Home/Sidebar/sidebar.dart';
import 'package:untitled3/manager/Home/client.dart';
import 'package:untitled3/manager/Home/dashboard/dashcategory.dart';
import 'package:untitled3/manager/Home/home_screen.dart';
import 'package:untitled3/manager/Home/order.dart';
import 'package:untitled3/manager/Home/workers.dart';
//import 'package:travel_web_dashboard/screens/Home/home_screen.dart';

import 'Sidebar/sidebar.dart';
import 'dashboard/dashboard.dart';

class Category extends StatefulWidget {
  Category(this.phonenumber);
  var phonenumber;
  @override
  _Category createState() => _Category(phonenumber);
}

class _Category extends State<Category> {
  _Category(this.phonenumber);
  var phonenumber;
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
                      Expanded(flex: 4, child: CategoryDash(phonenumber)),
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
