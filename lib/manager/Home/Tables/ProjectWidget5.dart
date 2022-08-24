import 'package:flutter/material.dart';
import 'package:untitled3/constant.dart';
import 'package:untitled3/manager/Home/category.dart';
import 'package:untitled3/services/authservice.dart';
import 'package:untitled3/services/index.dart';
import 'package:untitled3/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ProjectWidget5 extends StatefulWidget {
  ProjectWidget5({
    required phonenumber,
    required Size media,
  }) : _media = media;
  //  super(key: key);

  var _media, phonenumber;
  @override
  State<ProjectWidget5> createState() => _ProjectWidget5(_media, phonenumber);
}

class _ProjectWidget5 extends State<ProjectWidget5> {
  final Size _media;
  var phonenumber;
  Getorder getorder = Getorder();
  _ProjectWidget5(this._media, this.phonenumber);
  var search = '';
  List<String> workers = [];
  @override
  void initState() {
    setState(() {
      getworkername();
    });

    super.initState();
  }

  // TextEditingController namecontroller = TextEditingController();
  getworkername() {
    workers.clear();
    // AuthService().getorder().then((val) {
    //   for (int i = 0; i < val.length; i++) {
    //     if (val[i].toString().contains(search)) {

    //     }
    //   }
    // });
  }

  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        height: _media.height / 0.8,
        width: _media.width / 3 + 480,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Row(
                  children: [
                    //  Expanded(
                    // child:
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: TextFormField(
                        onChanged: (value) {
                          //  setState(() {
                          setState(() {
                            search = value;
                            getworkername();
                          });
                          //final _media = MediaQuery.of(context).size;
                          // });
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search...",
                          //   enabledBorder: InputBorder(),
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 80.0, left: 40, right: 50),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          //SizedBox(width: 20),
                          Text(
                            'اسم الزبون',
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            'اسم العامل',
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            'الوقت',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'التصنيف',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'الخدمة',
                            style: TextStyle(color: Colors.grey),
                          ),

                          Text(
                            'الحالة',
                            style: TextStyle(color: Colors.grey),
                          ),
                          // Text(
                          //   'حذف الطلب',
                          //   style: TextStyle(color: Colors.grey),
                          // ),
                        ],
                      ),
                      Divider(),
                      FutureBuilder<List>(
                        future: getorder.getorder(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return const Center(
                              child: Text(
                                'لايوجد معلومات',
                                textDirection: TextDirection.rtl,
                              ),
                            );
                          } else if (snapshot.hasData) {
                            List<int> needed = [];
                            for (int j = 0; j < snapshot.data!.length; j++) {
                              // number.clear();
                              if (snapshot.data![j]['status'].toString() !=
                                  'قيد الانتظار') {
                                if (snapshot.data![j]
                                    .toString()
                                    .contains(search)) needed.add(j);
                              }
                            }
                            // ignore: prefer_is_empty
                            if (needed.length == 0) {
                              print("object");
                              return const Center(
                                child: Text(
                                  'لايوجد معلومات',
                                  textDirection: TextDirection.rtl,
                                ),
                              );
                            } else {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: needed.length,
                                itemBuilder: (context, index) {
                                  // if (workers.isNotEmpty) {
                                  //   namecontroller.text = workers[index];
                                  // }

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 18),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 70,
                                          child: Text(
                                            snapshot.data![needed[index]]
                                                    ['clientname']
                                                .toString(),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),

                                        // if (workers.length <= index)
                                        //   Text(
                                        //     'اسم العامل'.toString(),
                                        //     textAlign: TextAlign.justify,
                                        //   ),
                                        // if (workers.length > index)
                                        //   Text(
                                        //     workers[index].toString(),
                                        //     textAlign: TextAlign.justify,
                                        //   ),
                                        Text(
                                          getorder
                                              .getworker()[needed[index]]
                                              .toString(),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(
                                          width: 85,
                                          child: Text(
                                            snapshot.data![needed[index]]
                                                    ['time']
                                                .toString()
                                                .replaceAll("Today", 'اليوم')
                                                .replaceAll("Tomorrow", 'غدا'),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 70,
                                          child: Text(
                                            snapshot.data![needed[index]]
                                                    ['category']
                                                .toString(),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 70,
                                          child: Text(
                                            snapshot.data![needed[index]]
                                                    ['service']
                                                .toString(),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),

                                        SizedBox(
                                          width: 70,
                                          child: Text(
                                            snapshot.data![needed[index]]
                                                    ['status']
                                                .toString(),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),

                                        // IconButton(
                                        //     iconSize: 30,
                                        //     icon: const Icon(Icons.remove),
                                        //     color: Colors.red,
                                        //     onPressed: () {
                                        //       AuthService()
                                        //           .d_order(snapshot
                                        //                   .data![needed[index]]
                                        //               ['_id'])
                                        //           .then((val) {
                                        //         Navigator.push(
                                        //             context,
                                        //             MaterialPageRoute(
                                        //                 builder: (context) =>
                                        //                     Category(
                                        //                         phonenumber)));
                                        //       });
                                        //     }),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          }
                          return const Center(
                            child: Text(
                              'لايوجد معلومات',
                              textDirection: TextDirection.rtl,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> it = [];
final List<String> images = [];
String? selectedValue;
