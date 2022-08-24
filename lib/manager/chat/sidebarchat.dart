// ignore_for_file: unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:untitled3/constant.dart';
import 'package:untitled3/manager/FadeAnimation.dart';
import 'package:untitled3/manager/chat/ChatRoom.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/services/authservice.dart';

class SideBarchat extends StatefulWidget {
  SideBarchat(this.phonenumber);
  var phonenumber;
  @override
  _SideBarchat createState() => _SideBarchat(phonenumber);
}

class cat {
  final category;
  final service;
  cat(this.category, this.service);
}

class _SideBarchat extends State<SideBarchat> {
  var phonenumber;
  _SideBarchat(this.phonenumber);
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //late List contacts;
  var selectedService;
  var email;
  List contactList = [];
  var search = '';
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
                  // if (!Responsive.isMobile(context)) ProfileCard(phonenumber),

                  const SizedBox(
                    height: 10,
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
                        });
                        //final _media = MediaQuery.of(context).size;
                        // });
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "بحث",
                        //   enabledBorder: InputBorder(),
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                  ),

                  Responsive(
                      mobile:
                          _size.width <= 420 ? second(_size) : second(_size),
                      desktop: second(_size)),
                ],
              ),
            ],
          ),
        ));
  }

  second(Size _size) {
    return Container(
      height: 800,
      child: FutureBuilder<List>(
          future: onshow(),
          builder: (context, snapshot) {
            //  print(snapshot.data);
            if (snapshot.hasData) {
              //print(snapshot.data);
              var d = snapshot.data?.length;
              List<int> needed = [];
              for (int j = 0; j < snapshot.data!.length; j++) {
                // number.clear();
                if (snapshot.data![j].toString().contains(search)) {
                  needed.add(j);
                  // AuthService()
                  //     .getcountclientorder(
                  //         snapshot.data![needed[j]]['name'])
                  //     .then((val) {
                  //   number.add(val);
                  //   print(val.toString());
                  // });
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
                    itemCount: needed.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return FadeAnimation(
                          (1.0 + index) / 4,
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  email = snapshot.data![index]['email'];
                                  String roomId = chatRoomId(phonenumber,
                                      snapshot.data![index]['name']);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatRoom(
                                        chatRoomId: roomId,
                                        userMap: snapshot.data![index],
                                      ),
                                    ),
                                  );
                                  if (selectedService == index)
                                    selectedService = -1;
                                  else
                                    selectedService = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: selectedService == index
                                      ? Colors.blue.shade50
                                      : Colors.grey.shade100,
                                  border: Border.all(
                                    color: selectedService == index
                                        ? const Color.fromARGB(255, 0, 0, 0)
                                        : const Color.fromARGB(255, 0, 0, 0)
                                            .withOpacity(0),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            snapshot.data![needed[index]]
                                                    ['name']
                                                .toString(),
                                            // .replaceAll(
                                            //     '@gmail.com', ""),
                                            textDirection: TextDirection.rtl,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Icon(
                                                Icons.chat,
                                                size: 20,
                                                color: Colors.black,
                                              )),
                                        ]),
                                  ],
                                ),
                                // ignore: prefer_const_literals_to_create_immutables
                              )));
                    });
              }
            } else {
              return const Center(
                child: Text(
                  'لايوجد معلومات',
                  textDirection: TextDirection.rtl,
                ),
              );
            }
          }),
    );
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  Future<List> onshow() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    var curent = FirebaseAuth.instance.currentUser?.email;
    await _firestore
        .collection('users')
        .where("email", isNotEqualTo: curent)
        .get()
        .then((value) {
      setState(() {
        contactList = [];
        for (int i = 0; i < value.docs.length; i++) {
          contactList.add(value.docs[i].data());
        }
      });
    });

    return contactList;
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('users')
        .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
    });
  }
}
