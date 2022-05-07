import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:vsf/models/notification_model.dart';

class NotificationState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  List<Notifications> _notifications = [];
  Future<bool> getNotifications() async {
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(
          Uri.parse("https://coralcity.pythonanywhere.com/notifications/"),
          headers: {'Authorization': "token $token"});
      var data = json.decode(response.body) as List;
      // print(data);
      List<Notifications> temp = [];
      for (var element in data) {
        Notifications notifications = Notifications.fromJson(element);
        temp.add(notifications);
      }
      _notifications = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getFeeds");
      print(e);
      return false;
    }
  }

  List<Notifications> get notifications {
    return [..._notifications];
  }
}
