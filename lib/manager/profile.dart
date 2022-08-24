// ignore_for_file: sort_child_properties_last

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:untitled3/services/authservice.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class CreatProfile extends StatefulWidget {
  @override
  _CreatProfileState createState() => _CreatProfileState();
}

class _CreatProfileState extends State<CreatProfile> {
  var name, about;
  late List<String> category = [];
  TextEditingController namecontrol = TextEditingController();
  TextEditingController phonenumbercontrol = TextEditingController();
  TextEditingController categorycontrol = TextEditingController();
  TextEditingController regioncontrol = TextEditingController();
  TextEditingController aboutcontrol = TextEditingController();
  // final networkHandler = NetworkHandler();
  PickedFile? _imageFile;
  var region;
  final ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
    init();
  }

  // var item;

  init() {
    List<String> cat = [];
    // AuthService().getworkerinfo(name).then((val) {
    //   print(val.data!['category'][0]);
    //   phonenumber = val.data['phonenumber'].toString();
    //   phonenumbercontrol.text = val.data['phonenumber'].toString();
    //   about = val.data['about'].toString();
    //   for (int i = 0; i < val.data['category'].length; i++) {
    //     cat.add(arabicitems[
    //         arabicitems.indexOf(val.data['category'][i].toString())]);
    //   }
    //   //  item = val.data['category'].toString();
    //   // print(arabicit[it.indexOf(val.data['region'].toString())]);
    //   regioncontrol.text = arabicit[it.indexOf(val.data['region'].toString())];
    //   // categorycontrol.text = val.data['category']
    //   //     .toString()
    //   //     .replaceAll("[", "")
    //   //     .replaceAll("]", "");
    //   categorycontrol.text =
    //       cat.toString().replaceAll("[", "").replaceAll("]", "");
    //   namecontrol.text = name;
    //   aboutcontrol.text = about;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE63220),
        title: const Text(
          'مرحبا بك                                              ',
          textDirection: TextDirection.rtl,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: <Widget>[
            imageProfile(),
            const SizedBox(
              height: 20,
            ),
            nameTextField(),
            const SizedBox(
              height: 20,
            ),
            passTextField(),
            const SizedBox(
              height: 20,
            ),
            // cpassTextField(),
            // const SizedBox(
            //   height: 20,
            // ),
            aboutTextField(),
            const SizedBox(
              height: 20,
            ),
            butt(),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? const AssetImage("def.png") as ImageProvider
              : FileImage(File(_imageFile!.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: const Icon(
              Icons.camera_alt,
              color: Color(0xffE63220),
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "اختر صورة لملفك الشخصي",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: const Text("Camera"),
            ),
            TextButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: const Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  var phonenumber, password;
  Widget nameTextField() {
    return TextField(
      textAlign: TextAlign.right,
      onChanged: ((value) {
        name = value;
      }),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        suffixIcon: Icon(
          Icons.person,
          color: Color(0xffE63220),
        ),
      ),
      controller: namecontrol,
    );
  }

  Widget butt() {
    return ElevatedButton(
      child: const Text(
        "حفظ الاعدادات",
        textDirection: TextDirection.rtl,
      ),
      onPressed: () {
        print(password);
        print(phonenumber);
        AuthService()
            .changeworkerrate("62a4b867099e95b352eb92fe", "1")
            .then((val) {
          Fluttertoast.showToast(
              msg: "val.data['msg']",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      },
      style: ElevatedButton.styleFrom(
        primary: const Color(0xffE63220),
        onPrimary: Colors.white,
        //shape: RoundedRectangleBorder(
        //borderRadius: BorderRadius.circular(32.0),
        //),
      ),
    );
  }

  Widget passTextField() {
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        password = value;
      },
      textAlign: TextAlign.right,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xffE63220),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange,
            width: 2,
          )),
          suffixIcon: Icon(
            Icons.lock,
            color: Color(0xffE63220),
          ),
          hintText: "ادخل كلمة السر ",
          hintTextDirection: TextDirection.rtl),
    );
  }

  Widget cpassTextField() {
    return TextFormField(
      textAlign: TextAlign.right,
      obscureText: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xffE63220),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange,
            width: 2,
          )),
          suffixIcon: Icon(
            Icons.lock,
            color: Color(0xffE63220),
          ),
          hintText: "تأكيد كلمة السر",
          hintTextDirection: TextDirection.rtl),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
      maxLines: 4,
      onChanged: ((value) {
        about = value;
      }),
      controller: aboutcontrol,
      textAlign: TextAlign.right,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xffE63220),
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        hintText: "تكلم عن نفسك",
      ),
    );
  }
}

final List<String> it = [
  'Nablus',
  'Ramallah',
  'Jenin',
  'Tolkarm',
  'Jericho',
  'Hebron',
  'Bethlehem'
];
final List<String> arabicit = [
  'نابلس',
  'رام الله',
  'جنين',
  'طولكرم',
  'اريحا',
  'الخليل',
  'بيت لحم'
];
String? selectedValue;

///list
final List<String> items = [
  'Cleaning',
  'Plumber',
  'Electrician',
  'Painter',
  'Gardener',
  'Carpenter',
];
final List<String> arabicitems = [
  'النظافة',
  'السباكة',
  'الكهرباء',
  'الدهان',
  'حدائق',
  'النجارة',
];
List<String> selectedItems = [];

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xffE63220);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
