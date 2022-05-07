import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vsf/screens/bank_transfer.dart';
import 'package:vsf/screens/widget/sub_card.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:http/http.dart' as http;

class PaymentMethod extends StatefulWidget {
  final int id;
  final String title;
  final String image;
  final String price;
  final Color color;
  const PaymentMethod(
      {Key? key,
      required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.color})
      : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String paystackPublicKey = 'pk_test_91130c972c5af7ec4b37e1a4a9428eb128d41f68';
  static String appName = 'VFX Services';

  final plugin = PaystackPlugin();

  @override
  void initState() {
    //initialize the publicKey
    plugin.initialize(publicKey: paystackPublicKey);
    super.initState();
  }

  //a method to show the message
  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //used to generate a unique reference for payment
  String _getReference() {
    var platform = (Platform.isIOS) ? 'iOS' : 'Android';
    final thisDate = DateTime.now().millisecondsSinceEpoch;
    return 'ChargedFrom${platform}_$thisDate';
  }

  //async method to charge users card and return a response
  chargeCard() async {
    var charge = Charge()
      ..amount = int.parse(widget.price) *
          580 *
          100 //the money should be in kobo hence the need to multiply the value by 100
      ..reference = _getReference()
      ..putCustomField('custom_id',
          '846gey6w') //to pass extra parameters to be retrieved on the response from Paystack
      ..email = 'vfsservices@gmail.com';

    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );

    //check if the response is true or not
    if (response.status == true) {
      //you can send some data from the response to an API or use webhook to record the payment on a database
      _showMessage('Payment was successful!!!');
    } else {
      //the payment wasn't successsful or the user cancelled the payment
      _showMessage('Payment Failed!!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 235, 233, 233),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Color(0xFF003D21),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: height,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWidth = constraints.maxWidth;
                      return Stack(fit: StackFit.expand, children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: innerHeight * 0.79,
                            width: innerWidth,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 2, left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    widget.title,
                                    style: const TextStyle(
                                      fontSize: 30,
                                      color: Color(0xFF003D21),
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: SubCard(
                                        id: widget.id,
                                        title: widget.title,
                                        image: widget.image,
                                        price: widget.price,
                                        color: widget.color),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Select a payment method to continue',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF003D21).withOpacity(0.6),
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        chargeCard();
                                      },
                                      child: Container(
                                        height: 70,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.15,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.5,
                                              color: const Color(0xFF006838)),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color(0xFFE5EFEA),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            children: const [
                                              Icon(Icons.credit_card_rounded,
                                                  color: Color(0xFF006838)),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "Pay with Card",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xFF006838),
                                                  fontFamily: "GTWalsheimPro",
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Spacer(),
                                              Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: Color(0xFF006838)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BankTransfer(
                                                        id: widget.id,
                                                        title: widget.title,
                                                        image: widget.image,
                                                        price: widget.price,
                                                        color: widget.color)));
                                      },
                                      child: Container(
                                        height: 70,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color(0xFFE5EFEA),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            children: const [
                                              Icon(Icons.apartment_rounded,
                                                  color: Color(0xFF006838)),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                "Pay with Bank Transfer",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xFF006838),
                                                  fontFamily: "GTWalsheimPro",
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Spacer(),
                                              Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: Color(0xFF006838)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]);
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
