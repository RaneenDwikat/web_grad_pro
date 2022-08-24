import 'package:flutter/material.dart';
import 'package:untitled3/services/authservice.dart';
import 'package:untitled3/services/index.dart';

class ProjectWidget3 extends StatefulWidget {
  ProjectWidget3({
    required Size media,
  }) : _media = media;
  //  super(key: key);
  var _media;
  @override
  _ProjectWidget3 createState() => _ProjectWidget3(_media);
}

class _ProjectWidget3 extends State<ProjectWidget3> {
  final Size _media;
  var searchh = '';
  TextEditingController countcontrol = TextEditingController();
  Getclient getclient = Getclient();
  _ProjectWidget3(this._media);
  List<int> number = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        height: _media.height / 0.8,
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
                            searchh = value;
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
                      const EdgeInsets.only(top: 50.0, left: 40, right: 50),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          SizedBox(width: 1),
                          Text(
                            'اسم العميل ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'رقم الهاتف ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            '  العنوان',
                            style: TextStyle(color: Colors.grey),
                          ),

                          Text(
                            'عدد الطلبات',
                            style: TextStyle(color: Colors.grey),
                          ),
                          // Text(
                          //   '  طلبات تم تنفيذها',
                          //   style: TextStyle(color: Colors.grey),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                        width: 80,
                      ),
                      const Divider(),
                      FutureBuilder<List>(
                        future: getclient.getclient(),
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
                              if (snapshot.data![j]
                                  .toString()
                                  .contains(searchh)) {
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
                                  // if (number.isNotEmpty) {
                                  //   setState(() {
                                  //     // number.add(val);
                                  //     countcontrol.text =
                                  //         number[index].toString();
                                  //     print(countcontrol.text);
                                  //   });
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
                                        Row(
                                          children: <Widget>[
                                            CircleAvatar(
                                              child: Text(snapshot
                                                  .data![needed[index]]['name']
                                                  .substring(0, 2)),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(snapshot.data![needed[index]]
                                                ['name']),
                                          ],
                                        ),
                                        Text(
                                          snapshot.data![needed[index]]
                                              ['phonenumber'],
                                          textAlign: TextAlign.justify,
                                        ),
                                        if (snapshot.data![needed[index]]
                                                ['region'] !=
                                            null)
                                          Text(
                                            snapshot.data![needed[index]]
                                                ['region'],
                                            textAlign: TextAlign.justify,
                                          ),
                                        if (snapshot.data![needed[index]]
                                                ['region'] ==
                                            null)
                                          Container(
                                            // ignore: sort_child_properties_last
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[]),

                                            height: 30,
                                            width: 100,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 231, 47, 34),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),

                                        Text(
                                          getclient
                                              .getcount()[needed[index]]
                                              .toString(),
                                          textAlign: TextAlign.justify,
                                        ),

                                        // SizedBox(
                                        //   width: 20,
                                        //   child: TextField(
                                        //     controller: countcontrol,
                                        //     textAlign: TextAlign.justify,
                                        //     readOnly: true,
                                        //   ),
                                        // )

                                        // Text(),
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
