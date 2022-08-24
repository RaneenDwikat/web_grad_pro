import 'package:flutter/material.dart';
import 'package:untitled3/constant.dart';
import 'package:untitled3/worker/hearderworker.dart';
import 'package:untitled3/worker/project_widgetworker1.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/manager/Home/Sidebar/sidebar.dart';
import 'package:untitled3/services/index.dart';
import 'package:untitled3/worker/project_widgetworker2.dart';

class Dashboardworker extends StatelessWidget {
  Dashboardworker(this.phonenumber);
  // categoryy = category,
  // servicee = service;
  var phonenumber;
  var categoryy;
  var servicee;

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    get3bestworker best = get3bestworker();
    List<String> img = [
      'images/A.png',
      'images/C.jpg',
      'images/B.png',
      'images/D.jpg',
    ];
    final Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: kBgColor, borderRadius: BorderRadius.circular(50.0)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Responsive(
                      mobile: _size.width <= 420
                          ? const MobHeader()
                          : Headerworker(phonenumber),
                      desktop: Headerworker(phonenumber)),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProjectWidgetworker(
                          media: _media,
                          phonenumber: phonenumber,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          thickness: 3,
                          color: kBgColor,
                        ),
                        ProjectWidgetworker1(
                          media: _media,
                          phonenumber: phonenumber,
                        ),
                        if (Responsive.isMobile(context)) SideBar(phonenumber),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// now we make our web responsive