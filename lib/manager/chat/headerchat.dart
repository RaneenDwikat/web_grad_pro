import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled3/manager/Home/Tables/ProjectWidget2.dart';
import 'package:untitled3/constant.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/manager/Home/workers.dart';
import 'package:untitled3/services/authservice.dart';
import 'package:untitled3/services/methods.dart';

class ChatHeader2 extends StatefulWidget {
  var phonenumber;
  ChatHeader2(this.phonenumber);

  @override
  _ChatHeader2 createState() => _ChatHeader2(phonenumber);
}

class _ChatHeader2 extends State<ChatHeader2> {
  var phonenumber, search, name, newphonenumber, region, password;
  List items = [];
  List<String> category = [];
  _ChatHeader2(this.phonenumber);

  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu)),
          ),
        const SizedBox(
            //     width: 400,
            ),
        const SizedBox(
          width: 350,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "المحادثات",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

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
              icon: const Icon(Icons.menu)),
        ),
        Column(
          children: [
            const Text(
              "Hello, Jeremy!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              "Explore the world",
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
        const Spacer(),
        Container(
          height: 35,
          width: 35,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: const Icon(
            Icons.search,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 35,
          width: 35,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: const Icon(
            Icons.notifications,
          ),
        )
      ],
    );
  }
}
