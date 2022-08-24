import 'package:flutter/material.dart';
import 'package:untitled3/services/authservice.dart';
import 'package:untitled3/services/index.dart';
import 'package:untitled3/theme.dart';

class ProjectWidget2 extends StatefulWidget {
  ProjectWidget2({
    required Size media,
  }) : _media = media;
  //  super(key: key);
  var _media;
  @override
  _ProjectWidget2 createState() => _ProjectWidget2(_media);
}

class _ProjectWidget2 extends State<ProjectWidget2> {
  final Size _media;
  var searchh = '';
  Getworker getworker = Getworker();
  _ProjectWidget2(this._media);
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
                    //  ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    // Container(
                    //   height: 40,
                    //   width: 60,
                    //   decoration: const BoxDecoration(
                    //       color: Colors.white, shape: BoxShape.circle),
                    //   child: IconButton(
                    //     icon: Icon(Icons.search),
                    //     onPressed: () {
                    //       print("ok");
                    //     },
                    //   ),
                    // ),
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
                            'اسم مزود الخدمة',
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
                            'مجال العمل',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'التقييم',
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
                        future: getworker.getworkercategory(),
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
                              if (snapshot.data![j]
                                  .toString()
                                  .contains(searchh)) {
                                needed.add(j);
                              }
                            }
                            // ignore: prefer_is_empty
                            if (needed.length == 0) {
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
                                // controller: ,
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
                                        Text(
                                          snapshot.data![needed[index]]
                                              ['region'],
                                          textAlign: TextAlign.justify,
                                        ),
                                        Text(
                                          snapshot.data![needed[index]]
                                                  ['category']
                                              .toString()
                                              .replaceAll("]", "")
                                              .replaceAll("[", ""),
                                          textAlign: TextAlign.justify,
                                        ),
                                        Container(
                                          // ignore: sort_child_properties_last
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                if (snapshot.data![
                                                            needed[index]]
                                                        ['rating'] !=
                                                    null)
                                                  for (int i = 0;
                                                      i <
                                                          snapshot.data![
                                                                  needed[index]]
                                                              ['rating'];
                                                      i++)
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.orange,
                                                      size: 20,
                                                    ),
                                              ]),

                                          height: 30,
                                          width: 100,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 245, 234, 137),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
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
