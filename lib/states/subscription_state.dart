import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:vsf/models/subscription_model.dart';

class SubscriptionState with ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  Future<bool> getSubscription(String referenceCode, String paystackAccessCode,
      String paymentFor, String amount, String date, String duration) async {
    var token = storage.getItem('token');
    var headers = {
      'Authorization': "token $token",
      "Content-Type": "application/json",
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('https://coralcity.pythonanywhere.com/account/payment/'));
    request.fields.addAll({
      'reference_code': referenceCode,
      'paystack_access_code': paystackAccessCode,
      'payment_for': paymentFor,
      'amount': amount,
      'date': date,
      'duration': duration,
    });
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

  List<Subscription> _subscriptions = [];
  Future<bool> getPaymentHistorys() async {
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(
          Uri.parse("https://coralcity.pythonanywhere.com/account/payment/"),
          headers: {'Authorization': "token $token"});
      var data = json.decode(response.body) as List;
      // print(data);
      List<Subscription> temp = [];
      for (var element in data) {
        Subscription subscriptions = Subscription.fromJson(element);
        temp.add(subscriptions);
      }
      _subscriptions = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("e getPaymentHistory");
      print(e);
      return false;
    }
  }

  List<Subscription> get subscription {
    return [..._subscriptions];
  }
}
