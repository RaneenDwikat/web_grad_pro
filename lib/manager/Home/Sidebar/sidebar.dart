// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:untitled3/constant.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/services/authservice.dart';

import 'component/profilecard.dart';

class SideBar extends StatefulWidget {
  SideBar(this.phonenumber);
  var phonenumber;
  @override
  _SideBar createState() => _SideBar(phonenumber);
}

class cat {
  final category;
  final service;
  cat(this.category, this.service);
}

class _SideBar extends State<SideBar> {
  var phonenumber;
  _SideBar(this.phonenumber);

  // List<String> category;
  // List service;
  List<cat> categoryy = [];
  //_SideBarState(this.category, this.service);
  List service = [];
  List<String> categor = [];
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!Responsive.isMobile(context)) ProfileCard(phonenumber),
                  SizedBox(
                    height: 10,
                  ),
                  /*  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {},
                    child: Text('+ قم باضافة مزود خدمة جديد'),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                  ),
                  Responsive(
                      mobile:
                          _size.width <= 420 ? SchudleCardMob() : SchudleCard(),
                      desktop: SchudleCard()),
                  TableCalendar(
                    focusedDay: DateTime.now(),
                    firstDay: DateTime(2021),
                    lastDay: DateTime(2050),
                    calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                            color: kPrimaryColor, shape: BoxShape.circle)),
                  ),
                  Divider(
                    thickness: 4,
                    color: kBgColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Responsive(
                      mobile: _size.width <= 420 ? second() : second(),
                      desktop: second()),
                  SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  // first() {
  //   return FutureBuilder(
  //     future: second2(),
  //     //  initialData: InitialData,
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //       return Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             SfCartesianChart(
  //               series: <ChartSeries>[
  //                 BarSeries<cat, String>(
  //                     dataSource: categoryy,
  //                     xValueMapper: (cat c, _) => c.category,
  //                     yValueMapper: (cat c, _) => int.parse(c.service)),
  //               ],
  //               primaryXAxis: CategoryAxis(),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  second2() async {
    await AuthService().getcategory().then((val) async {
      for (int i = 0; i < val.length; i++) {
        categor.add(val[i]['name']);
        await AuthService().getcountoforder(val[i]['name']).then((value) {
          service.add(value.toString());
          var c = cat(val[i]['name'], value.toString());
          if (!categoryy.contains(c.category)) {
            categoryy.add(c);
          }
        });
      }
    });
  }

  second() {
    return FutureBuilder(
      future: second2(),
      //  initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SfCartesianChart(
                series: <ChartSeries>[
                  BarSeries<cat, String>(
                      dataSource: categoryy,
                      xValueMapper: (cat c, _) => c.category,
                      yValueMapper: (cat c, _) => int.parse(c.service)),
                ],
                primaryXAxis: CategoryAxis(),
              ),
            ],
          ),
        );
      },
    );
  }
}

final List<String> items = [
  'Item1',
  'Item2',
  'Item3',
  'Item4',
];
List<String> selectedItems = [];
final List<String> it = [
  'Nablus',
  'Ramallah',
  'Jenin',
  'Tolkarm',
];
String? selectedValue;

class SchudleCardMob extends StatefulWidget {
  SchudleCardMob({
    Key? key,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SchudleCardMobState createState() =>
      // ignore: no_logic_in_create_state
      _SchudleCardMobState();
}

class _SchudleCardMobState extends State<SchudleCardMob> {
  @override
  void initState() {
    super.initState();
    AuthService().getcountorder().then((val) {
      countcontrol.text = val.toString();
    });
    AuthService().getcountclient().then((val) {
      clientcontrol.text = val.toString();
    });
    AuthService().getcountworker().then((val) {
      workercontrol.text = val.toString();
    });
  }

  TextEditingController countcontrol = TextEditingController();
  TextEditingController workercontrol = TextEditingController();
  TextEditingController clientcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* Text(
            "My Schedule",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),*/
          Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.business_sharp,
                  color: Colors.orange,
                  size: 50,
                ),
                title: TextField(
                  controller: countcontrol,
                  readOnly: true,
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: const Text('الطلبات'),
              ),
            ]),
          ),
          Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.engineering,
                  color: Colors.green,
                  size: 50,
                ),
                title: TextField(
                  controller: workercontrol,
                  style: TextStyle(fontSize: 20),
                  readOnly: true,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
                subtitle: Text('عامل'),
              ),
            ]),
          ),
          Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                  leading: Icon(
                    Icons.show_chart,
                    color: Color.fromARGB(255, 255, 1, 170),
                    size: 50,
                  ),
                  title: TextField(
                    controller: clientcontrol,
                    style: TextStyle(fontSize: 20),
                    readOnly: true,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                  subtitle: Text('زبون')),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class SchudleCard extends StatefulWidget {
  const SchudleCard({
    Key? key,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SchudleCardState createState() =>
      // ignore: no_logic_in_create_state
      _SchudleCardState();
}

class _SchudleCardState extends State<SchudleCard> {
  @override
  void initState() {
    super.initState();
    AuthService().getcountorder().then((val) {
      countcontrol.text = val.toString();
    });
    AuthService().getcountclient().then((val) {
      clientcontrol.text = val.toString();
    });
    AuthService().getcountworker().then((val) {
      workercontrol.text = val.toString();
    });
  }

  TextEditingController countcontrol = TextEditingController();
  TextEditingController workercontrol = TextEditingController();
  TextEditingController clientcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /*   Text(
            "My Schedule",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),*/
          Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                // ignore: prefer_const_constructors
                leading: Icon(
                  Icons.business_sharp,
                  color: Colors.orange,
                  size: 50,
                ),
                title: TextField(
                  controller: countcontrol,
                  readOnly: true,
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: const Text('الطلبات'),
              ),
            ]),
          ),
          Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.engineering,
                  color: Colors.green,
                  size: 50,
                ),
                title: TextField(
                  controller: workercontrol,
                  style: TextStyle(fontSize: 20),
                  readOnly: true,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
                subtitle: Text('عامل'),
              ),
            ]),
          ),
          Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.show_chart,
                  color: Color.fromARGB(255, 255, 1, 170),
                  size: 50,
                ),
                title: TextField(
                  controller: clientcontrol,
                  style: TextStyle(fontSize: 20),
                  readOnly: true,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
                subtitle: Text('زبون'),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String image, title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.only(
          left: 10,
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.grey)),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(image),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScheduleCardMob extends StatelessWidget {
  const ScheduleCardMob({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String image, title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.grey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
