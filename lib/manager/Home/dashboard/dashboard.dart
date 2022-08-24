import 'package:flutter/material.dart';
import 'package:untitled3/constant.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/manager/Home/Tables/project_widget.dart';
import 'package:untitled3/manager/Home/Sidebar/sidebar.dart';
import 'package:untitled3/services/index.dart';

import 'component/hearder.dart';

class Dashboard extends StatelessWidget {
  Dashboard({required phonenumber
      // , required category, required service
      })
      : phonenumberr = phonenumber;
  // categoryy = category,
  // servicee = service;
  var phonenumberr;
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
                      mobile: _size.width <= 420 ? const MobHeader() : Header(),
                      desktop: Header()),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 360,
                      child: FutureBuilder<List>(
                        future: best.getbestworker(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text(
                                'لايوجد معلومات',
                                textDirection: TextDirection.rtl,
                              ),
                            );
                          } else if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              img[index],
                                              height: 300,
                                              width: 200,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data![index]['name'],
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.location_on,
                                                        color: Colors.black),
                                                    Text(
                                                      snapshot.data![index]
                                                          ['region'],
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Icon(Icons.star,
                                                        color: Colors.black),
                                                    Text(
                                                      snapshot.data![index]
                                                              ['rating']
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return const Center(
                              child: Text(
                                'لايوجد معلومات',
                                textDirection: TextDirection.rtl,
                              ),
                            );
                          }
                        },
                      )),
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
                        Padding(
                          padding: EdgeInsets.only(left: 9),
                          child:
                              // ignore: prefer_const_literals_to_create_immutables
                              Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const SizedBox(
                                width: 570,
                              ),
                              const Text(
                                "سجل احدث الطلبات",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        ProjectWidget(
                          _media,
                          phonenumberr,
                        ),
                        const SizedBox(
                          height: 500,
                        ),
                        const Divider(
                          thickness: 3,
                          color: kBgColor,
                        ),
                        if (Responsive.isMobile(context)) SideBar(phonenumberr),
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