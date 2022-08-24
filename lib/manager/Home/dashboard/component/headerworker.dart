import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled3/manager/Home/Tables/ProjectWidget2.dart';
import 'package:untitled3/constant.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/manager/Home/workers.dart';
import 'package:untitled3/services/authservice.dart';
import 'package:untitled3/services/methods.dart';

class WorkerHeader2 extends StatefulWidget {
  var phonenumber;
  WorkerHeader2(this.phonenumber);

  @override
  _WorkerHeader2 createState() => _WorkerHeader2(phonenumber);
}

class _WorkerHeader2 extends State<WorkerHeader2> {
  var phonenumber, search, name, newphonenumber, region, password;
  List items = [];
  List<String> category = [];
  _WorkerHeader2(this.phonenumber);
  @override
  void initState() {
    AuthService().getcategory().then((val) {
      print(val);
      for (int i = 0; i < val.length; i++) {
        items.add(val[i]['name']);
      }
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu)),
          ),
        //Spacer(),
        // const SizedBox(
        //   width: 70,
        // ),
        // Expanded(
        //   child: Container(
        //     height: 50,
        //     decoration: BoxDecoration(
        //         color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        //     child: TextFormField(
        //       onChanged: (value) {
        //         setState(() {
        //           search = value;
        //           final _media = MediaQuery.of(context).size;
        //         });
        //       },
        //       decoration: const InputDecoration(
        //         prefixIcon: Icon(Icons.search),
        //         hintText: "Search...",
        //         enabledBorder: InputBorder.none,
        //         focusedBorder: InputBorder.none,
        //       ),
        //     ),
        //   ),
        // ),
        // const SizedBox(
        //   width: 10,
        // ),
        // Container(
        //   height: 50,
        //   width: 60,
        //   decoration:
        //       const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        //   child: IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () {
        //       print("ok");
        //     },
        //   ),
        // ),

        const SizedBox(
            //     width: 400,
            ),
        Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              // ignore: unnecessary_new
              child: new InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: const Text('اضافة مزود خدمة'),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    onChanged: (value) => name = value,
                                    decoration: const InputDecoration(
                                      labelText: 'الاسم',
                                      icon: Icon(Icons.account_box),
                                    ),
                                  ),
                                  TextFormField(
                                    onChanged: (value) =>
                                        newphonenumber = value,
                                    decoration: const InputDecoration(
                                      labelText: 'رقم الجوال',
                                      icon: Icon(Icons.phone),
                                    ),
                                  ),
                                  TextFormField(
                                    onChanged: (value) => password = value,
                                    decoration: InputDecoration(
                                      labelText: 'كلمة السر',
                                      icon: Icon(Icons.password),
                                    ),
                                  ),
                                  TextFormField(
                                    onChanged: (value) {
                                      region = value;
                                      print(region);
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'المنطقة ',
                                      icon: Icon(Icons.location_pin),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    " مجال العمل؟",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      hint: Align(
                                        alignment: AlignmentDirectional.center,
                                        child: Text(
                                          'اختر مجالات العمل',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Theme.of(context).hintColor,
                                          ),
                                        ),
                                      ),
                                      items: items.map((item) {
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          //disable default onTap to avoid closing menu when selecting an item
                                          enabled: false,
                                          child: StatefulBuilder(
                                            builder: (context, menuSetState) {
                                              final _isSelected =
                                                  selectedItems.contains(item);
                                              return InkWell(
                                                onTap: () {
                                                  if (_isSelected) {
                                                    selectedItems.remove(item);
                                                    category.remove(item);
                                                  } else {
                                                    selectedItems.add(item);
                                                    category.add(item);
                                                  }
                                                  // _isSelected
                                                  //     ? selectedItems
                                                  //         .remove(item)
                                                  //     : selectedItems.add(item);
                                                  //This rebuilds the StatefulWidget to update the button's text
                                                  setState(() {});
                                                  //This rebuilds the dropdownMenu Widget to update the check mark
                                                  menuSetState(() {});
                                                },
                                                child: Container(
                                                  height: double.infinity,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 16.0),
                                                  child: Row(
                                                    children: [
                                                      _isSelected
                                                          ? const Icon(Icons
                                                              .check_box_outlined)
                                                          : const Icon(Icons
                                                              .check_box_outline_blank),
                                                      const SizedBox(width: 20),
                                                      Text(
                                                        item,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }).toList(),

                                      //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                                      value: selectedItems.isEmpty
                                          ? null
                                          : selectedItems.last,
                                      onChanged: (value) {},
                                      buttonHeight: 20,
                                      buttonWidth: 300,
                                      itemHeight: 20,
                                      itemPadding: EdgeInsets.zero,
                                      selectedItemBuilder: (context) {
                                        return items.map(
                                          (item) {
                                            return Container(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0),
                                              child: Text(
                                                selectedItems.join(', '),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                maxLines: 1,
                                              ),
                                            );
                                          },
                                        ).toList();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            MaterialButton(
                                //  style: Style( backgroundColor: Colors.green,

                                child: const Text("اضافة"),
                                onPressed: () {
                                  region = region
                                      .toString()
                                      .replaceAll('نابلس', "Nablus");
                                  region = region
                                      .toString()
                                      .replaceAll('رام الله', "Ramallah");
                                  region = region
                                      .toString()
                                      .replaceAll('طولكرم', "Tolkarm");
                                  region = region
                                      .toString()
                                      .replaceAll('جنين', "Jenin");
                                  region = region
                                      .toString()
                                      .replaceAll('اريحا', "Jericho");
                                  region = region
                                      .toString()
                                      .replaceAll('بيت لحم', "Bethlehem");
                                  region = region
                                      .toString()
                                      .replaceAll('الخليل', "Hebron");
                                  var namefirebase = '';
                                  namefirebase = newphonenumber + "@gmail.com";
                                  print(region
                                      .toString()
                                      .replaceAll("نابلس", "replace"));
                                  AuthService()
                                      .addWorker(name, password, newphonenumber,
                                          category, region)
                                      .then((val) {
                                    createAccount(name, namefirebase, password)
                                        .then((value) {
                                      Fluttertoast.showToast(
                                          msg: "تمت عملية الاضافة بنجاح",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.green,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    });
                                  });
                                })
                          ],
                        );
                      });
                },
                child: Container(
                  width: 200.0,
                  height: 40.0,
                  child: const Text(
                    "        + اضافة مزود خدمة جديد",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 350,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            " قائمة مزودي الخدمة ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
//one header for mobile and other for desktop

// final List<String> items = [
//   'Item1',
//   'Item2',
//   'Item3',
//   'Item4',
// ];
List<String> selectedItems = [];
final List<String> it = [
  'Nablus',
  'Ramallah',
  'Jenin',
  'Tolkarm',
];
String? selectedValue;

class MobHeader2 extends StatelessWidget {
  MobHeader2(this.phonenumber);
  var phonenumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu)),
        ),
        Column(
          children: [
            const Text(
              "Hello, Jeremy!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              "Explore the world",
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
        const Spacer(),
        Container(
          height: 35,
          width: 35,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: const Icon(
            Icons.search,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 35,
          width: 35,
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: const Icon(
            Icons.notifications,
          ),
        )
      ],
    );
  }
}
