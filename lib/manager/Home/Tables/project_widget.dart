import 'package:flutter/material.dart';
import 'package:untitled3/manager/Home/home_screen.dart';
import 'package:untitled3/services/authservice.dart';
import 'package:untitled3/services/index.dart';

class ProjectWidget extends StatefulWidget {
  ProjectWidget(this.media, this.phonenumber);
  final Size media;
  var phonenumber;
  @override
  State<ProjectWidget> createState() => _ProjectWidget(media, phonenumber);
}

class _ProjectWidget extends State<ProjectWidget> {
  _ProjectWidget(this._media, this.phonenumberr);
  //  super(key: key);
  TextEditingController namecontrol = TextEditingController();
  TextEditingController logocontrol = TextEditingController();
  var phonenumberr;
  final Size _media;
  gettodayorders best = gettodayorders();
  List<String> worker = [];
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        height: _media.height / 1.9,
        width: _media.width / 3 + 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                /* Positioned(
                  top: 10,
                  left: 20,
                  child: Text(
                    'سجل احدث الطلبات',
                    style: cardTitleTextStyle,
                  ),
                ),*/
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 20, right: 50),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          // SizedBox(width: 5),
                          Text(
                            'اسم العامل',
                            style: TextStyle(color: Colors.grey),
                          ),

                          Text(
                            'اسم الزبون',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            ' نوع الخدمة',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'العنوان ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'الحاله',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'حذف الطلب',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                        width: 80,
                      ),
                      Divider(),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 18),
                      //   child:
                      FutureBuilder<List>(
                          future: best.gettodaysorders(),
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
                                shrinkWrap: true,
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  AuthService()
                                      .getworkernameandphonenumber(
                                          snapshot.data![index]['worker'])
                                      .then((val) {
                                    namecontrol.text = val['name'];
                                    logocontrol.text =
                                        val['name'].substring(0, 2);
                                  });
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 18),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            CircleAvatar(
                                                child: TextField(
                                              controller: logocontrol,
                                              readOnly: true,
                                              decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          left: 7, bottom: 7)),
                                            )
                                                // Text(worker[index]
                                                //     .toString()
                                                //     .substring(0, 2)
                                                // ),
                                                ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 70,
                                              child: TextField(
                                                controller: namecontrol,
                                                readOnly: true,
                                                decoration:
                                                    const InputDecoration(
                                                        border:
                                                            InputBorder.none),
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          snapshot.data![index]['clientname'],
                                          textAlign: TextAlign.justify,
                                        ),
                                        Text(
                                          snapshot.data![index]['category'],
                                          textAlign: TextAlign.justify,
                                        ),
                                        Text(
                                          snapshot.data![index]['address'][0],
                                          textAlign: TextAlign.justify,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 80,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            // projectItems[index]
                                            //             .priority
                                            //             .index ==
                                            //         0
                                            //     ? 'Low'
                                            //     : projectItems[index]
                                            //                 .priority
                                            //                 .index ==
                                            //             1
                                            //         ? 'Medium'
                                            //         : 'High',
                                            snapshot.data![index]['status'],
                                            textAlign: TextAlign.justify,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            AuthService()
                                                .d_order(snapshot.data![index]
                                                    ['_id'])
                                                .then((val) {
                                              setState(() {
                                                best.gettodaysorders();
                                              });
                                            });
                                          },
                                          child: Text("حذف الطلب"),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const Text("لا يوجد معلومات");
                            }
                          }),
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
