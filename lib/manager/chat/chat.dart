import 'package:flutter/material.dart';
import 'package:untitled3/manager/Home/Sidebar/sidebar.dart';
import 'package:untitled3/manager/chat/dashchat.dart';
import 'package:untitled3/model.dart/responsive.dart';
import 'package:untitled3/manager/Home/Menu/menu.dart';

//import 'package:travel_web_dashboard/screens/Home/home_screen.dart';

class Chat extends StatefulWidget {
  Chat(this.phonenumber);
  var phonenumber;
  @override
  _Chat createState() => _Chat(phonenumber);
}

class _Chat extends State<Chat> {
  _Chat(this.phonenumber);
  var phonenumber;
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    return Scaffold(
      // now we make it more professional
      // remove all litsview widgets
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
                      Expanded(flex: 4, child: ChatDash(phonenumber)),
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
