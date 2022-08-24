import 'package:flutter/material.dart';
import 'package:untitled3/manager/Home/home_screen.dart';
import 'package:untitled3/services/authservice.dart';
import 'package:untitled3/services/index.dart';
import 'package:untitled3/worker/home_screen.dart';

class ProjectWidgetworker extends StatefulWidget {
  var phonenumber;
  final Size _media;

  ProjectWidgetworker(
      {
      // required Key key,
      required Size media,
      required phonenumber})
      : _media = media,
        phonenumber = phonenumber;
  @override
  _ProjectWidgetworker createState() =>
      _ProjectWidgetworker(phonenumber, _media);
}

class _ProjectWidgetworker extends State<ProjectWidgetworker> {
  _ProjectWidgetworker(this.phonenumberr, this._media);

  //  super(key: key);
  TextEditingController namecontrol = TextEditingController();
  TextEditingController logocontrol = TextEditingController();
  var phonenumberr;
  final Size _media;
  gettodayorders best = gettodayorders();
  var id = '!';
  @override
  void initState() {
    // TODO: implement initState
    AuthService().getworkerinfo(phonenumberr).then((val) {
      setState(() {
        id = val['_id'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        height: _media.height / 1.9,
        width: _media.width / 3 + 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                const Positioned(
                  top: 10,
                  left: 650,
                  child: Text(
                    'سجل احدث الطلبات',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
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
                            'اسم الزبون',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            '  الخدمة',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'العنوان ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'الوقت',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'قبول الطلب',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                        width: 80,
                      ),
                      const Divider(),
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
                              List<int> needed = [];
                              if (id == '!') {
                                return const Center(
                                  child: Text(
                                    'لايوجد معلومات',
                                    textDirection: TextDirection.rtl,
                                  ),
                                );
                              } else {
                                for (int j = 0;
                                    j < snapshot.data!.length;
                                    j++) {
                                  // number.clear();
                                  print(snapshot.data![j]['worker']);
                                  if (snapshot.data![j]['worker']
                                      .contains(id)) {
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
                                    shrinkWrap: true,
                                    itemCount: needed.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 18),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: <Widget>[
                                            Text(
                                              snapshot.data![needed[index]]
                                                  ['clientname'],
                                              textAlign: TextAlign.justify,
                                            ),
                                            Text(
                                              snapshot.data![needed[index]]
                                                  ['service'],
                                              textAlign: TextAlign.justify,
                                            ),
                                            Text(
                                              snapshot.data![needed[index]]
                                                  ['address'][1],
                                              textAlign: TextAlign.justify,
                                            ),
                                            Text(
                                              snapshot.data![needed[index]]
                                                      ['time']
                                                  .toString()
                                                  .replaceAll("Today", 'اليوم')
                                                  .replaceAll(
                                                      "Tomorrow", 'غدا'),
                                              textAlign: TextAlign.justify,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                AuthService().acceptrequest(
                                                    snapshot.data![
                                                        needed[index]]['_id']);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Homescreenworker(
                                                                phonenumberr)));
                                              },
                                              child: const Text("قبول الطلب"),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }
                              }
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
