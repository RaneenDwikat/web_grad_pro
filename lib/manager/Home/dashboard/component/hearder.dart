import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled3/manager/Home/home_screen.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/services/authservice.dart';
import 'package:untitled3/services/methods.dart';

class Header extends StatefulWidget {
  Header();
  @override
  State<Header> createState() => _Header();
}

class _Header extends State<Header> {
  var phonenumber, name, password;
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
                Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // ignore: unnecessary_new
                  child: new InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              title: const Text('اضافة مدير جديد'),
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Form(
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        onChanged: (value) => name = value,
                                        decoration: const InputDecoration(
                                          labelText: 'اسم المستخدم',
                                          icon: Icon(Icons.account_box),
                                        ),
                                      ),
                                      TextFormField(
                                        onChanged: (value) =>
                                            phonenumber = value,
                                        decoration: const InputDecoration(
                                          labelText: 'رقم الجوال',
                                          icon: Icon(Icons.phone),
                                        ),
                                      ),
                                      TextFormField(
                                        onChanged: (value) => password = value,
                                        decoration: InputDecoration(
                                          labelText: 'كلمة السر',
                                          icon: Icon(Icons.password),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                    child: const Text("اضافة"),
                                    onPressed: () {
                                      var namefirebase = '';
                                      namefirebase = phonenumber + "@gmail.com";
                                      AuthService()
                                          .addmanager(
                                              name, password, phonenumber)
                                          .then((val) {
                                        createAccount(
                                                name, namefirebase, password)
                                            .then((value) {
                                          Fluttertoast.showToast(
                                              msg: "تمت عملية الاضافة بنجاح",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                          setState(() {
                                            Navigator.pop(context);
                                          });
                                        });
                                      });
                                    })
                              ],
                            );
                          });
                    },
                    child: Container(
                      width: 200.0,
                      height: 40.0,
                      child: const Text(
                        "      + اضافة مدير جديد",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 300,
                ),
                const Text(
                  "!افضل الصنايعية لهذا الشهر",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
