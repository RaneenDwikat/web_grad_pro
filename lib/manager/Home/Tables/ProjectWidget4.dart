import 'package:flutter/material.dart';
import 'package:untitled3/constant.dart';
import 'package:untitled3/manager/Home/category.dart';
import 'package:untitled3/services/authservice.dart';
import 'package:untitled3/services/index.dart';
import 'package:untitled3/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ProjectWidget4 extends StatefulWidget {
  ProjectWidget4({
    required phonenumber,
    required Size media,
  }) : _media = media;
  //  super(key: key);

  var _media, phonenumber;
  @override
  State<ProjectWidget4> createState() => _ProjectWidget4(_media, phonenumber);
}

class _ProjectWidget4 extends State<ProjectWidget4> {
  final Size _media;
  var phonenumber;
  Getservice getservice = Getservice();
  var service, estimatedtime, newcategory, img;
  _ProjectWidget4(this._media, this.phonenumber);
  @override
  void initState() {
    it.clear();
    AuthService().getcategory().then((val) {
      print(val);
      for (int i = 0; i < val.length; i++) {
        setState(() {
          it.add(val[i]['name']);
          images.add(val[i]['image']);
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }

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
                /*  Text(
                  " قائمة مزودي الخدمة ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),*/

                //hon

                DropdownButtonHideUnderline(
                  child: Positioned(
                    top: 8,
                    left: 60,
                    child: DropdownButton2(
                      hint: Text(
                        'اختر الفئة',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      items: it
                          .map((it) => DropdownMenuItem<String>(
                                value: it,
                                child: Text(
                                  it,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value.toString();
                          // ignore: prefer_interpolation_to_compose_strings
                          img = images[it.indexOf(selectedValue.toString())];
                        });
                      },
                      buttonHeight: 30,
                      buttonWidth: 200,
                      itemHeight: 30,
                    ),
                  ),
                ),

                Positioned(
                  top: 0,
                  left: 550,
                  child: IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.add),
                    color: Colors.red,
                    onPressed: () {
                      if (selectedValue != null) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: Text('اضافة خدمة جديدة'),
                                content: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Form(
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          onChanged: (value) {
                                            service = value;
                                          },
                                          decoration: const InputDecoration(
                                            labelText: 'الخدمة ',
                                            icon: Icon(Icons.room_service),
                                          ),
                                        ),

                                        TextFormField(
                                          onChanged: (value) {
                                            setState(() {
                                              estimatedtime = value;
                                            });
                                          },
                                          decoration: const InputDecoration(
                                            labelText:
                                                ' الوقت المتوقع بالدقائق',
                                            icon: Icon(Icons.timelapse),
                                          ),
                                        ),

                                        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                                      ],
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                      child: const Text(
                                        "اضافة",
                                        style: TextStyle(color: kPrimaryColor),
                                      ),
                                      onPressed: () {
                                        // your code
                                        AuthService()
                                            .addservice(selectedValue, service,
                                                estimatedtime, img)
                                            .then((val) {
                                          setState(() {
                                            Navigator.pop(context);
                                          });

                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             Category(phonenumber)));
                                        });
                                      })
                                ],
                              );
                            });
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                title: Text('اضافة خدمة جديدة'),
                                content: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Form(
                                    child: Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.cancel,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          "قم باختيار التصنيف اولا",
                                        ),
                                        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    },
                  ),
                ),
                if (selectedValue != null)
                  Positioned(
                    top: 8,
                    left: 600,
                    child: Text(
                      selectedValue.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                if (selectedValue == null)
                  Positioned(
                    top: 8,
                    left: 600,
                    child: Text(
                      "التصنيف",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                Positioned(
                  top: 8,
                  left: 280,
                  child: Text(
                    ':الخدمة  ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                Positioned(
                  top: 8,
                  left: 280,
                  child: Text(
                    ':الخدمة  ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 80.0, left: 40, right: 50),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(width: 20),
                          Text(
                            '  الخدمة',
                            style: TextStyle(color: Colors.grey),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            'الوقت المتوقع',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Divider(),
                      FutureBuilder<List>(
                        future: getservice.getservice(),
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
                                  .contains(selectedValue.toString())) {
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
                                    padding: const EdgeInsets.only(bottom: 18),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: <Widget>[
                                        IconButton(
                                            iconSize: 30,
                                            icon: const Icon(Icons.remove),
                                            color: Colors.red,
                                            onPressed: () {
                                              AuthService()
                                                  .d_service(snapshot
                                                          .data![needed[index]]
                                                      ['_id'])
                                                  .then((val) {
                                                setState(() {
                                                  getservice.getservice();
                                                });
                                              });
                                            }),
                                        Text(
                                          snapshot.data![needed[index]]
                                              ['service'],
                                          textAlign: TextAlign.justify,
                                        ),
                                        Text(
                                          snapshot.data![needed[index]]
                                                  ['estimatedTime']
                                              .toString(),
                                          textAlign: TextAlign.justify,
                                        ),
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
