import 'package:flutter/material.dart';
import 'package:untitled3/services/authservice.dart';

import '../../../../constant.dart';

class ProfileCard extends StatefulWidget {
  var phonenumber;
  ProfileCard(this.phonenumber);
  @override
  _ProfileCardState createState() => _ProfileCardState(phonenumber);
}

class _ProfileCardState extends State<ProfileCard> {
  var phonenumber;
  _ProfileCardState(this.phonenumber);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(phonenumber);
    AuthService().getadminname(phonenumber).then((val) {
      namecontrol.text = val.toString();
      print(val.toString());
    });
  }

  TextEditingController namecontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: kBgColor, borderRadius: BorderRadius.circular(50)),
          child: Image.asset(
            "assets/images/profile.png",
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              height: 25,
              child: TextField(
                controller: namecontrol,
                decoration: InputDecoration(border: InputBorder.none),
                readOnly: true,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Text(
              "مدير الموقع",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ],
        ),
        // SizedBox(
        //   width: 15.0,
        // ),
        //  Icon(Icons.keyboard_arrow_down)
      ],
    );
  }
}
