import 'package:flutter/material.dart';
import 'package:untitled3/constant.dart';
import 'package:untitled3/manager/Home/Tables/ProjectWidget4.dart';
// import 'package:untitled3/model.dart/place_model.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/manager/Home/Sidebar/sidebar.dart';
import 'package:untitled3/manager/Home/dashboard/component/headercategory.dart';
// import 'component/placecard.dart';

class CategoryDash extends StatefulWidget {
  CategoryDash(this.phonenumber);
  var phonenumber;
  @override
  State<CategoryDash> createState() => _CategoryDash(phonenumber);
}

class _CategoryDash extends State<CategoryDash> {
  var phonenumber;
  _CategoryDash(this.phonenumber);
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    final Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
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
                      mobile: _size.width <= 420
                          ? MobHeader2(phonenumber)
                          : CategoryHeader(phonenumber),
                      desktop: CategoryHeader(phonenumber)),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*   Row(
                            //  padding: const EdgeInsets.only(left: 10),
                            children: <Widget>[
                              Text(
                                " قائمة مزودي الخدمة ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                                Text(
                          "Region",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        //hon
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text(
                              'Select Item',
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: it
                                .map((it) => DropdownMenuItem<String>(
                                      value: it,
                                      child: Text(
                                        it,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                              });
                            },
                            buttonHeight: 20,
                            buttonWidth: 300,
                            itemHeight: 20,
                          ),
                        ),
                            ]),
                      */
                        ProjectWidget4(media: _media, phonenumber: phonenumber),
                        const SizedBox(
                          height: 500,
                        ),
                        Divider(
                          thickness: 3,
                          color: kBgColor,
                        ),
                        if (Responsive.isMobile(context)) SideBar(phonenumber),
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

final List<String> it = [
  'Nablus',
  'Ramallah',
  'Jenin',
  'Tolkarm',
];
String? selectedValue;

// now we make our web responsive