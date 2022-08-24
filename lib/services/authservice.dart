// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
// import 'package:Fluttertoast/Fluttertoast.dart';

class AuthService {
  Dio dio = new Dio();

  login(name, password) async {
    try {
      return await dio.post('http://10.0.2.2:3000/authenticate',
          data: {
            "name": name,
            "password": password,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  addOrder(name, List<String> address, category, service, worker, time) async {
    return await dio.post('http://10.0.2.2:3000/addorder',
        data: {
          "name": name,
          "category": category,
          "service": service,
          "worker": worker,
          "time": time,
          "address": address
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  savelocation(latitude, longitude, name, region, address) async {
    try {
      return await dio.put('http://10.0.2.2:3000/savelocation',
          data: {
            "name": name,
            "latitude": latitude,
            "longitude": longitude,
            "region": region,
            "address": address,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getlocation(name) async {
    try {
      return await dio.get('http://10.0.2.2:3000/getlocation/$name');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  cancelrequest(_id) async {
    try {
      return await dio.put('http://10.0.2.2:3000/cancelrequest/$_id',
          data: {
            "_id": _id,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getworkername(phonenumber) async {
    try {
      return await dio.get('http://10.0.2.2:3000/getworkername/$phonenumber');
    } on DioError catch (e) {
      // Fluttertoast.showToast(
      // msg: e.response!.data['msg'],
      // toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.BOTTOM,
      // backgroundColor: Colors.red,
      // textColor: Colors.white,
      // fontSize: 16.0);
    }
  }

  setratefororder(_id, rate) async {
    try {
      return await dio.put('http://10.0.2.2:3000/rateorder/$_id',
          data: {
            "rating": rate,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      // Fluttertoast.showToast(
      //     msg: e.response!.data['msg'],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  addtimeforworker(_id, time) async {
    try {
      return await dio.put('http://10.0.2.2:3000/addtimeforworker/$_id',
          data: {
            "time": time,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      // Fluttertoast.showToast(
      //     msg: e.response!.data['msg'],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  updateworkerinfo(name, category, password, region, phonenumber, about) async {
    try {
      return await dio.put('http://10.0.2.2:3000/updateworkerinfo/$phonenumber',
          data: {
            "name": name,
            "category": category,
            "password": password,
            "region": region,
            "about": about,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      // Fluttertoast.showToast(
      //     msg: e.response!.data['msg'],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  getclientnameandphonenumber(clientname) async {
    try {
      return await dio
          .get('http://10.0.2.2:3000/getclientnameandphonenumber/$clientname');
    } on DioError catch (e) {
      // Fluttertoast.showToast(
      // msg: e.response!.data['msg'],
      // toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.BOTTOM,
      // backgroundColor: Colors.red,
      // textColor: Colors.white,
      // fontSize: 16.0);
    }
  }

  getassignedorder(_id) async {
    try {
      return await dio.get('http://10.0.2.2:3000/getassignedorder/$_id');
    } on DioError catch (e) {
      // Fluttertoast.showToast(
      // msg: e.response!.data['msg'],
      // toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.BOTTOM,
      // backgroundColor: Colors.red,
      // textColor: Colors.white,
      // fontSize: 16.0);
    }
  }

  endrequest(_id, durationTime) async {
    try {
      return await dio.put('http://10.0.2.2:3000/endrequest/$_id',
          data: {
            "_id": _id,
            "durationTime": durationTime,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  startrequest(_id) async {
    try {
      return await dio.put('http://10.0.2.2:3000/startrequest/$_id',
          data: {
            "_id": _id,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getlast10times(service) async {
    try {
      return await dio.get('http://10.0.2.2:3000/getlast10times/$service');
    } on DioError catch (e) {
      // Fluttertoast.showToast(
      // msg: e.response!.data['msg'],
      // toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.BOTTOM,
      // backgroundColor: Colors.red,
      // textColor: Colors.white,
      // fontSize: 16.0);
    }
  }

  changeestimatedtime(service, estimatedTime) async {
    try {
      return await dio.put('http://10.0.2.2:3000/changeestimatedtime/$service',
          data: {
            "service": service,
            "estimatedTime": estimatedTime,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getworkerrate(worker) async {
    try {
      return await dio.get('http://10.0.2.2:3000/getworkerrate/$worker');
    } on DioError catch (e) {
      // Fluttertoast.showToast(
      // msg: e.response!.data['msg'],
      // toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.BOTTOM,
      // backgroundColor: Colors.red,
      // textColor: Colors.white,
      // fontSize: 16.0);
    }
  }

  changeworkerrate(_id, rating) async {
    String url = 'http://127.0.0.1:3000/changeworkerrate/$_id';
    return await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "_id": _id,
        "rating": rating,
      }),
    );
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////
/////web
  getworkernameandphonenumber(_id) async {
    try {
      String url = ('http://127.0.0.1:3000/getworkernameandphonenumber/$_id');
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  d_order(_id) async {
    try {
      String url = ('http://127.0.0.1:3000/d_order/$_id');
      var response = await http.delete(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  getcountorder() async {
    try {
      String url = ('http://127.0.0.1:3000/getcountorder');
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  getcountworker() async {
    try {
      String url = ('http://127.0.0.1:3000/getcountworker');
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  getcountclient() async {
    try {
      String url = ('http://127.0.0.1:3000/getcountclient');
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  getadminname(phonenumber) async {
    try {
      String url = ('http://127.0.0.1:3000/getadminname/$phonenumber');
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  getcategory() async {
    try {
      String url = ('http://127.0.0.1:3000/getcategory');
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  getcountoforder(category) async {
    try {
      String url = ('http://127.0.0.1:3000/getcountorderbycategory/$category');
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  loginm(phonenumber, password) async {
    String url = 'http://127.0.0.1:3000/authenticatem';
    return await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"password": password, "phonenumber": phonenumber}),
    );
  }

  loginw(phonenumber, password) async {
    String url = ('http://127.0.0.1:3000/authenticatew');
    return await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"password": password, "phonenumber": phonenumber}),
    );
  }

  addmanager(name, password, phonenumber) async {
    String url = 'http://127.0.0.1:3000/addmanager';
    return await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": name,
        "password": password,
        "phonenumber": phonenumber
      }),
    );
  }

  addWorker(name, password, phonenumber, List<String> category, region) async {
    String url = 'http://127.0.0.1:3000/addworker';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "name": name,
        "password": password,
        "phonenumber": phonenumber,
        "category": category,
        "region": region
      }),
    );
  }

  adduser(name, password, phonenumber) async {
    String url = 'http://127.0.0.1:3000/adduser';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "name": name,
        "password": password,
        "phonenumber": phonenumber,
      }),
    );
  }

  getcountclientorder(clientname) async {
    try {
      String url = ('http://127.0.0.1:3000/getcountclientorder/$clientname');
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  getclient() async {
    try {
      String url = ('http://127.0.0.1:3000/mgetclients');
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  getorder() async {
    try {
      String url = ('http://127.0.0.1:3000/mgetorders');
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  addservice(catname, service, estimatedTime, Img) async {
    String url = 'http://127.0.0.1:3000/addservice';
    return await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "catname": catname,
        "service": service,
        "estimatedTime": estimatedTime,
        "Img": Img
      }),
    );
  }

  addcategory(name, image) async {
    String url = 'http://127.0.0.1:3000/addcategory';
    return await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": name,
        "image": image,
      }),
    );
  }

  d_service(_id) async {
    try {
      String url = ('http://127.0.0.1:3000/d_service/$_id');
      var response = await http.delete(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  acceptrequest(_id) async {
    try {
      String url = ('http://127.0.0.1:3000/acceptrequest/$_id');
      var response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }

  getworkerinfo(phonenumber) async {
    try {
      String url = ('http://127.0.0.1:3000/getworkerinfo/$phonenumber');
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      print(e);
    }
  }
}
