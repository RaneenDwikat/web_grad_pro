import 'package:flutter/material.dart';
import 'package:untitled3/constant.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/manager/Home/Tables/ProjectWidget2.dart';
import 'package:untitled3/manager/Home/Sidebar/sidebar.dart';
import 'package:untitled3/manager/Home/dashboard/component/headerworker.dart';

class Dash extends StatelessWidget {
  Dash(this.phonenumber);
  var phonenumber;
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    final Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
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
                          ? MobHeader2(phonenumber)
                          : WorkerHeader2(phonenumber),
                      desktop: WorkerHeader2(phonenumber)),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProjectWidget2(
                          media: _media,
                        ),
                        const SizedBox(
                          height: 500,
                        ),
                        Divider(
                          thickness: 3,
                          color: kBgColor,
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