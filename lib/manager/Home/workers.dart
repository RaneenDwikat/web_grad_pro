import 'package:flutter/material.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/manager/Home/Menu/menu.dart';
import 'package:untitled3/manager/Home/Sidebar/sidebar.dart';
import 'package:untitled3/manager/Home/category.dart';
import 'package:untitled3/manager/Home/client.dart';
import 'package:untitled3/manager/Home/dashboard/dashworker.dart';
import 'package:untitled3/manager/Home/home_screen.dart';
import 'package:untitled3/manager/Home/order.dart';

class Workers extends StatefulWidget {
  var phonenumber;
  Workers(this.phonenumber);

  @override
  _WorkersState createState() => _WorkersState(phonenumber);
}

class _WorkersState extends State<Workers> {
  var phonenumber;
  _WorkersState(this.phonenumber);
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    return Scaffold(
      // now we make it more professional
      // // remove all litsview widgets
      // drawer: Drawer(
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const UserAccountsDrawerHeader(
      //         // <-- SEE HERE
      //         decoration: BoxDecoration(
      //             color: Color.fromARGB(255, 255, 255, 255),
      //             //const Color(0xffE63220)
      //             image: DecorationImage(
      //               image: AssetImage("images/logo3.png"),
      //               scale: 2.7,
      //               // fit: BoxFit.fill,
      //               alignment: FractionalOffset.center,
      //             )),
      //         accountName: Text(
      //           "",
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         accountEmail: Text(
      //           " ",
      //           textAlign: TextAlign.center,
      //           style: TextStyle(
      //             height: 2,
      //             fontSize: 18,
      //             fontWeight: FontWeight.bold,
      //             color: Colors.black,
      //           ),
      //         ),
      //         //   currentAccountPicture: FlutterLogo(),
      //       ),
      //       ListTile(
      //         trailing: Icon(
      //           Icons.account_circle,
      //         ),
      //         title: const Text('الصفحة الرئيسية',
      //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //             textDirection: TextDirection.rtl),
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => Homescreen(phonenumber)));
      //         },
      //       ),
      //       ListTile(
      //         trailing: Icon(
      //           Icons.shopping_cart,
      //         ),
      //         title: const Text('الخدمات المتاحة',
      //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //             textDirection: TextDirection.rtl),
      //         onTap: () {
      //           print("zft");
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => Category(phonenumber)));
      //         },
      //       ),
      //       ListTile(
      //         trailing: Icon(
      //           Icons.home_repair_service,
      //         ),
      //         title: const Text('مزودي الخدمة  ',
      //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //             textDirection: TextDirection.rtl),
      //         onTap: () {
      //           print("zft");
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => Workers(phonenumber)));
      //         },
      //       ),
      //       ListTile(
      //         trailing: Icon(
      //           Icons.subject,
      //         ),
      //         title: const Text('الطلبات',
      //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //             textDirection: TextDirection.rtl),
      //         onTap: () {
      //           print("zft");
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => Orders(phonenumber)));
      //         },
      //       ),
      //       ListTile(
      //         trailing: Icon(
      //           Icons.help,
      //         ),
      //         title: const Text(
      //           'العملاء',
      //           textDirection: TextDirection.rtl,
      //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //         ),
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => Client(phonenumber)));
      //         },
      //       ),
      //       ListTile(
      //         trailing: Icon(
      //           Icons.logout,
      //         ),
      //         title: const Text(
      //           'تسجيل الخروج',
      //           textDirection: TextDirection.rtl,
      //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //         ),
      //         onTap: () {
      //           /*    Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => LoginPage()));*/
      //         },
      //       ),
      //     ],
      //   ),
      //   /*child: ListView(
      //     children: [
      //       DrawerHeader(
      //           child: Center(
      //         child: CircleAvatar(
      //           backgroundImage: NetworkImage(
      //               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI4JuatGP6M5_Q0wYSkx2jAVzJff1FBaPYXV7zFbMngh5RV6J7'),
      //           backgroundColor: Colors.white,
      //           radius: 100,
      //         ),
      //       )),
      //       MenuCardList(
      //         icon: Icons.dashboard,
      //         press: () {},
      //         inactiveColor: true,
      //         title: 'Dashboard',
      //       ),
      //       MenuCardList(
      //         icon: Icons.card_giftcard,
      //         press: () {},
      //         title: 'My Tickets',
      //       ),
      //       MenuCardList(
      //         icon: Icons.favorite_outline,
      //         press: () {},
      //         title: 'Favourite',
      //       ),
      //       MenuCardList(
      //         icon: Icons.email_outlined,
      //         press: () {},
      //         title: 'Messages',
      //       ),
      //       MenuCardList(
      //         icon: Icons.account_balance_wallet_outlined,
      //         press: () {},
      //         title: 'transaction',
      //       ),
      //       MenuCardList(
      //         icon: Icons.settings,
      //         press: () {},
      //         title: 'Setting',
      //       ),
      //     ],
      //   ),*/
      // ),
      drawer: Menu(phonenumber),
      body: Row(
        children: [
          //menu

          if (Responsive.isDesktop(context))
            Expanded(flex: 1, child: Menu(phonenumber)),
          //main section
          Expanded(
              flex: 6,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(flex: 4, child: Dash(phonenumber)),
                      if (!Responsive.isMobile(context))
                        Expanded(flex: 2, child: SideBar(phonenumber)),
                    ],
                  ),
                ],
              )),

          //sidebar
        ],
      ),
    );
  }
}
