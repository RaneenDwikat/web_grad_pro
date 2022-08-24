// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types

import 'package:untitled3/manager/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/services/index.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class CategoriesPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  @override
  // ignore: library_private_types_in_public_api
  _CategoriesPageState createState() =>
      // ignore: no_logic_in_create_state
      _CategoriesPageState();
}

// ignore: duplicate_ignore
class _CategoriesPageState extends State<CategoriesPage> {
  var name, category;
  var selectedService = -1;
  var selected, _rating;
  getcat service = getcat();
  @override
  void initState() {
    _rating = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(153.0), // here the desired height
          child: AppBar(
            backgroundColor: const Color(0xffF8C80E),
            flexibleSpace: const Image(
              image: AssetImage('logo3.png'),
              fit: BoxFit.none,
            ),
            /* title: Image.asset('assets/logo3.png',
                width: 150, height: 150, fit: BoxFit.fill

                // height: 200,
                ),*/
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: FutureBuilder<List>(
              future: service.getAllCategory(),
              builder: (context, snapshot) {
                //  print(snapshot.data);
                if (snapshot.hasData) {
                  //print(snapshot.data);
                  var d = snapshot.data?.length;

                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 5.0,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    snapshot.data![index]['name'],
                                    textDirection: TextDirection.rtl,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    snapshot.data![index]['image']
                                        .toString()
                                        .replaceAll("assets/", ''),
                                    width: 35,
                                    height: 35,
                                  ),
                                ]),
                          ],
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
              }),
        ));
  }
}
