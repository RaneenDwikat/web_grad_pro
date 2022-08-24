import 'package:flutter/material.dart';
import 'package:untitled3/constant.dart';
import 'package:untitled3/main.dart';
import 'package:untitled3/manager/Home/category.dart';
import 'package:untitled3/manager/Home/client.dart';
import 'package:untitled3/manager/Home/home_screen.dart';
import 'package:untitled3/manager/Home/order.dart';
import 'package:untitled3/manager/Home/workers.dart';
import 'package:untitled3/manager/chat/chat.dart';
import 'package:untitled3/services/authservice.dart';
import 'package:untitled3/services/methods.dart';

class Menu extends StatefulWidget {
  var phonenumber;
  Menu(this.phonenumber);
  @override
  // ignore: library_private_types_in_public_api
  _MenuState createState() =>
      // ignore: no_logic_in_create_state
      _MenuState(phonenumber);
}
//  accountEmail: TextField(
//               controller: namecontrol,
//               readOnly: true,
//               decoration: const InputDecoration(border: InputBorder.none),
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 height: 2,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),

class _MenuState extends State<Menu> {
  var phonenumber;
  _MenuState(this.phonenumber);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthService().getadminname(phonenumber).then((val) {
      namecontrol.text = val.toString() + " مرحبا";
    });
  }

  TextEditingController namecontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            // <-- SEE HERE

            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                //const Color(0xffE63220)
                image: DecorationImage(
                  image: AssetImage("images/logo3.png"),
                  scale: 2.7,

                  // fit: BoxFit.fill,

                  alignment: FractionalOffset.center,
                )),

            accountName: Text(
              "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            accountEmail: Text(
              " ",
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 2,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            //   currentAccountPicture: FlutterLogo(),
          ),
          ListTile(
            trailing: Icon(
              Icons.account_circle,
            ),
            title: const Text('الصفحة الرئيسية',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textDirection: TextDirection.rtl),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Homescreen(phonenumber)));
            },
          ),
          ListTile(
            trailing: Icon(
              Icons.chat,
            ),
            title: const Text('المحادثات',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textDirection: TextDirection.rtl),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Chat(phonenumber)));
            },
          ),
          ListTile(
            trailing: Icon(
              Icons.shopping_cart,
            ),
            title: const Text('الخدمات المتاحة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textDirection: TextDirection.rtl),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Category(phonenumber)));
            },
          ),
          ListTile(
            trailing: Icon(
              Icons.home_repair_service,
            ),
            title: const Text('مزودي الخدمة  ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textDirection: TextDirection.rtl),
            onTap: () {
              print("zft");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Workers(phonenumber)));
            },
            /* onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupWPage()));
                },*/
          ),
          ListTile(
            trailing: Icon(
              Icons.subject,
            ),
            title: const Text('الطلبات',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textDirection: TextDirection.rtl),
            onTap: () {
              print("zft");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Orders(phonenumber)));
            },
          ),
          ListTile(
            trailing: Icon(
              Icons.people,
            ),
            title: const Text(
              'العملاء',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Client(phonenumber)));
            },
          ),
          ListTile(
            trailing: Icon(
              Icons.logout,
            ),
            title: const Text(
              'تسجيل الخروج',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              logOut(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ],
      ),
    );
  }
}

class MenuCardList extends StatelessWidget {
  const MenuCardList({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
    this.inactiveColor = false,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback press;
  final bool inactiveColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: inactiveColor ? kPrimaryColor : Colors.transparent,
      // ignore: prefer_const_constructors
      child: ListTile(
        onTap: press,
        leading: Icon(icon, color: inactiveColor ? Colors.white : Colors.grey),
        horizontalTitleGap: 0.0,
        title: Text(
          title,
          style: TextStyle(color: inactiveColor ? Colors.white : Colors.grey),
        ),
      ),
    );
  }
}
