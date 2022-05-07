import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:vsf/models/feeds_model.dart';

class FeedState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  List<Feeds> _feeds = [];
  Future<bool> getFeeds() async {
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(
          Uri.parse("https://coralcity.pythonanywhere.com/feeds/"),
          headers: {'Authorization': "token $token"});
      var data = json.decode(response.body) as List;
      // print(data);
      List<Feeds> temp = [];
      for (var element in data) {
        Feeds feed = Feeds.fromJson(element);
        temp.add(feed);
      }
      _feeds = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getFeeds");
      print(e);
      return false;
    }
  }

  List<Feeds> get feeds {
    return [..._feeds];
  }
}
