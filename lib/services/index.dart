import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled3/services/authservice.dart';

class getcat {
  String baseUrl = "http://127.0.0.1:3000/getcategory";
  Future<List> getAllCategory() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        // print("object");
        // print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class getservice {
  String baseUrl = "http://10.0.2.2:3000/getservice";
  Future<List> getAllCategory() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        //print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class getorders {
  Future<List> getorder(String name) async {
    try {
      String baseUrl = "http://10.0.2.2:3000/getorder/$name";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        //print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class cancelorder {
  Future<List> cancel(String _id) async {
    try {
      String baseUrl = "http://10.0.2.2:3000/cancelrequest/$_id";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        //print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class getspacificorder {
  Future<List> getspacific(String _id) async {
    try {
      String baseUrl = "http://10.0.2.2:3000/getspacificorder/$_id";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class getworkers {
  Future<List> getworker(String category, region) async {
    try {
      String baseUrl = "http://10.0.2.2:3000/getworkers/$category/$region";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class getworkerorders {
  var id;
  getid() {
    return id;
  }

  Future<List> getworkerorder(String phonenumber) async {
    try {
      String baseUrl = "http://10.0.2.2:3000/getworkerid/$phonenumber";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        id = jsonDecode(response.body)['_id'];
        print(response.body);
        String baseUrl = "http://10.0.2.2:3000/getworkerorders/$id";
        var response0 = await http.get(Uri.parse(baseUrl));
        print(jsonDecode(response0.body));
        return jsonDecode(response0.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class getworkerassignedorders {
  var id;
  getid() {
    return id;
  }

  Future<List> getworkerorder(String phonenumber) async {
    try {
      String baseUrl = "http://10.0.2.2:3000/getworkerid/$phonenumber";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        id = jsonDecode(response.body)['_id'];
        print(response.body);
        String baseUrl = "http://10.0.2.2:3000/getassignedorder/$id";
        var response0 = await http.get(Uri.parse(baseUrl));
        return jsonDecode(response0.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

//////////////////////////////////////////////////////////////////////////////////////
///web
class get3bestworker {
  String baseUrl = "http://127.0.0.1:3000/get3bestworker";
  Future<List> getbestworker() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        // print("object");
        // print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class gettodayorders {
  String baseUrl = "http://127.0.0.1:3000/gettodaysorder";
  Future<List> gettodaysorders() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        // print("object");
        // print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class Getworker {
  String url = '';
  Future<List> getworkercategory() async {
    url = ('http://127.0.0.1:3000/mgetworkers');
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class Getclient {
  List count = [];
  getcount() {
    return count;
  }

  var result;
  String url = '';
  Future<List> getclient() async {
    url = ('http://127.0.0.1:3000/mgetclients');
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        for (int i = 0; i < result.length; i++) {
          await AuthService()
              .getcountclientorder(result[i]['name'])
              .then((res) {
            count.add(res);
            return result;
          });
        }
        return result;
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class Getservice {
  String url = '';
  Future<List> getservice() async {
    url = ('http://127.0.0.1:3000/getservice');
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class Getorder {
  String url = '';
  List workers = [];
  var result;
  getworker() {
    return workers;
  }

  Future<List> getorder() async {
    url = ('http://127.0.0.1:3000/mgetorders');
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        result = jsonDecode(response.body);
        for (int i = 0; i < result.length; i++) {
          await AuthService()
              .getworkernameandphonenumber(result[i]['worker'])
              .then((value) {
            workers.add(value['name']);
            return result;
          });
        }
        return result;
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
