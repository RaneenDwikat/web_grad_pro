// ignore_for_file: avoid_print, unnecessary_new

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/manager/Home/category.dart';
import 'package:untitled3/services/authservice.dart';

class CategoryHeader extends StatefulWidget {
  CategoryHeader(this.phonenumber);
  var phonenumber;
  @override
  _CategoryHeader createState() => _CategoryHeader(phonenumber);
}

class _CategoryHeader extends State<CategoryHeader> {
  var phonenumber;
  var name, image;
  _CategoryHeader(this.phonenumber);
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu)),
          ),
        //Spacer(),
        SizedBox(
          width: 70,
        ),
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search...",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 50,
          width: 60,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Icon(
            Icons.search,
          ),
        ),
        SizedBox(
            //     width: 400,
            ),
        Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: new InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Text('اضافة فئة جديدة'),
                          content: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Form(
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        name = value.toString();
                                        // ignore: prefer_interpolation_to_compose_strings
                                        image = 'assets/' + name + '.png';
                                      });
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'الخدمة بالعربي',
                                      icon: Icon(Icons.room_service),
                                    ),
                                  ),
                                  TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        image = value.toString();
                                        // ignore: prefer_interpolation_to_compose_strings
                                        image = 'assets/' + image + '.png';
                                      });
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'الخدمة بالانجليزي',
                                      icon: Icon(Icons.room_service),
                                    ),
                                  ),
                                  /*   TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: 'العنوان',
                                                  icon: Icon(Icons.message),
                                                ),
                                              ),*/

                                  //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                child: Text("اضافة"),
                                onPressed: () {
                                  // your code
                                  AuthService()
                                      .addcategory(name, image)
                                      .then((val) {
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  });
                                })
                          ],
                        );
                      });
                  print("tapped");
                },
                child: Container(
                  width: 160.0,
                  height: 40.0,
                  child: const Text(
                    "+ اضافة فئة جديدة",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
//one header for mobile and other for desktop

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

class MobHeader2 extends StatelessWidget {
  MobHeader2(this.phonenumber);
  var phonenumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu)),
        ),
        Column(
          children: [
            Text(
              "Hello, Jeremy!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Explore the world",
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
        Spacer(),
        Container(
          height: 35,
          width: 35,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Icon(
            Icons.search,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 35,
          width: 35,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Icon(
            Icons.notifications,
          ),
        )
      ],
    );
  }
}
