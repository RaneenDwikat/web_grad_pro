// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/manager/Home/Menu/menu.dart';
import 'package:untitled3/manager/Home/Sidebar/sidebar.dart';
import 'package:untitled3/manager/Home/category.dart';
import 'package:untitled3/manager/Home/dashboard/dashboardclient.dart';
import 'package:untitled3/manager/Home/home_screen.dart';
import 'package:untitled3/manager/Home/order.dart';
import 'package:untitled3/manager/Home/workers.dart';

class Client extends StatefulWidget {
  var phonenumber;
  Client(this.phonenumber);

  @override
  _ClientState createState() => _ClientState(phonenumber);
}

class _ClientState extends State<Client> {
  var phonenumber;
  _ClientState(this.phonenumber);
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
                      Expanded(flex: 4, child: Dashclient(phonenumber)),
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
