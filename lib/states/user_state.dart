// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class UserState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  Future<bool> loginNow(String uname, String passw) async {
    try {
      http.Response response = await http.post(
          Uri.parse("https://coralcity.pythonanywhere.com/account/login/"),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({"username": uname, "password": passw}));
      var data = json.decode(response.body) as Map;

      if (data.containsKey("token")) {
        storage.setItem("token", data['token']);
        print(storage.getItem('token'));
        return true;
      }
      return false;
    } catch (e) {
      print("e loginNow");
      print(e);
      return false;
    }
  }

  Future<bool> registernow(String uname, String passw, String email,
      String lastname, String firstname) async {
    try {
      http.Response response = await http.post(
          Uri.parse("https://coralcity.pythonanywhere.com/account/register/"),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            "username": uname,
            "password": passw,
            "first_name": firstname,
            "last_name": lastname,
            "email": email,
          }));
      var data = json.decode(response.body) as Map;
      print(data);
      if (data["error"] == false) {
        try {
          http.Response response = await http.post(
              Uri.parse("https://coralcity.pythonanywhere.com/account/login/"),
              headers: {
                "Content-Type": "application/json",
              },
              body: json.encode({"username": uname, "password": passw}));
          var data = json.decode(response.body) as Map;

          if (data.containsKey("token")) {
            storage.setItem("token", data['token']);
            print(storage.getItem('token'));
            return true;
          }
          return false;
        } catch (e) {
          print("e loginNow");
          print(e);
          return false;
        }
      }
      return false;
    } catch (e) {
      print("e loginNow");
      print(e);
      return false;
    }
  }

  Future<bool> otpvalidate(String phonenumber) async {
    var token = storage.getItem('token');

    var headers = {
      'Authorization': "token $token",
      "Content-Type": "application/json",
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('https://coralcity.pythonanywhere.com/account/otpverify/'));
    request.fields.addAll({'phonenumber': phonenumber});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<bool> changePassword(String oldP, String newP) async {
    var token = storage.getItem('token');

    var headers = {
      'Authorization': "token $token",
      "Content-Type": "application/json",
    };
    var request = http.MultipartRequest(
        'PUT',
        Uri.parse(
            'https://coralcity.pythonanywhere.com/account/changepassword/'));
    request.fields.addAll({'old_password': oldP, 'new_password': newP});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<bool> otpmsg(String phonenumber) async {
    var token = storage.getItem('token');

    var headers = {
      'Authorization': "token $token",
      "Content-Type": "application/json",
    };
    var request = http.MultipartRequest(
        'GET',
        Uri.parse(
            'https://coralcity.pythonanywhere.com/account/verify/$phonenumber/'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<bool> otpverify(String phonenumber, String currentText) async {
    var token = storage.getItem('token');

    var headers = {
      'Authorization': "token $token",
      "Content-Type": "application/json",
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://coralcity.pythonanywhere.com/account/verify/$phonenumber/'));
    request.fields.addAll({'otp': currentText});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
