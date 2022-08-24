import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/services/authservice.dart';
import 'package:untitled3/services/methods.dart';
import 'package:untitled3/manager/Home/client.dart';

class clientHeader2 extends StatefulWidget {
  var phonenumber;
  clientHeader2(this.phonenumber);

  @override
  _clientHeader2 createState() => _clientHeader2(phonenumber);
}

class _clientHeader2 extends State<clientHeader2> {
  var phonenumber, search, name, newphonenumber, password;
  List items = [];
  _clientHeader2(this.phonenumber);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
        Column(
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
                          title: const Text('اضافة عميل جديد'),
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
                                        newphonenumber = value,
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
                                  namefirebase = newphonenumber + "@gmail.com";
                                  AuthService()
                                      .adduser(name, password, newphonenumber)
                                      .then((val) {
                                    createAccount(name, namefirebase, password)
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
                    "      + اضافة عميل جديد",
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
        const SizedBox(
          width: 350,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            " قائمة العملاء",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
//one header for mobile and other for desktop

// final List<String> items = [
//   'Item1',
//   'Item2',
//   'Item3',
//   'Item4',
// ];
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
