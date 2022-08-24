import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled3/main.dart';
import 'package:untitled3/manager/Home/home_screen.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/services/authservice.dart';
import 'package:untitled3/services/methods.dart';

class Headerworker extends StatefulWidget {
  Headerworker(this.phonenumber);

  var phonenumber, name, password;
  @override
  _Headerworker createState() => _Headerworker(phonenumber);
}

class _Headerworker extends State<Headerworker> {
  var phonenumber;
  _Headerworker(this.phonenumber);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    AuthService().getworkerinfo(phonenumber).then((val) {
      print(val['name'].toString() + "hii");
      namecontrol.text = ' مرحبا ' + val['name'].toString();
    });
  }

  TextEditingController namecontrol = TextEditingController();

  @override
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
        Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    logOut(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  color: Colors.red,
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  width: 600,
                ),
                SizedBox(
                  width: 200,
                  height: 25,
                  child: TextField(
                    controller: namecontrol,
                    decoration: const InputDecoration(border: InputBorder.none),
                    readOnly: true,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
        const Spacer(),
        /*  Expanded(
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
          width: 50,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Icon(
            Icons.notifications,
          ),
        )*/
      ],
    );
  }
}
//one header for mobile and other for desktop

class MobHeader extends StatelessWidget {
  const MobHeader({
    Key? key,
  }) : super(key: key);

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
        /*  Column(
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
        ),*/
        const Spacer(),
        /*  Container(
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
        )*/
      ],
    );
  }
}
