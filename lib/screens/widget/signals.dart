import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignalScreen extends StatefulWidget {
  SignalScreen({Key? key}) : super(key: key);

  @override
  State<SignalScreen> createState() => _SignalScreenState();
}

class _SignalScreenState extends State<SignalScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      color: const Color(0xFF003D21),
      backgroundColor: Colors.white,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 47, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Signal Group",
                  style: TextStyle(
                      fontFamily: "GTWalsheimPro",
                      fontSize: 32,
                      color: Color(0xFF003D21),
                      fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Center(
                    child: Text(
                      "Latest",
                      style: TextStyle(
                          fontFamily: "GTWalsheimPro",
                          fontSize: 17,
                          color: Color(0xFF006838),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.15,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        10), // Image border
                                    child: SizedBox.fromSize(
                                      size: Size.fromRadius(50), // Image radius
                                      child: Image.asset("assets/logo/logo.png",
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: ListTile(
                                          title: Text(
                                            "Sell Crash 500",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: Color(0xFF003D21),
                                              fontFamily: "GTWalsheimPro",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "Sun, 27 February | 12:24AM",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF003D21),
                                              fontFamily: "GTWalsheimPro",
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 83),
                            child: Row(
                              children: [
                                const Text(
                                  "@",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF003D21),
                                    fontFamily: "GTWalsheimPro",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  " - ",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF003D21),
                                    fontFamily: "GTWalsheimPro",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "5461",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF003D21),
                                    fontFamily: "GTWalsheimPro",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: GestureDetector(
                                      onTap: () {
                                        Clipboard.setData(const ClipboardData(
                                                text: "inviteLink"))
                                            .then((value) {
                                          //only if ->
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text("Copied")));
                                        });
                                      },
                                      child: const Icon(
                                        Icons.copy,
                                        size: 12,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 83, top: 5),
                            child: Row(
                              children: [
                                const Text(
                                  "TP",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF003D21),
                                    fontFamily: "GTWalsheimPro",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  " - ",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF003D21),
                                    fontFamily: "GTWalsheimPro",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "Open",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF003D21),
                                    fontFamily: "GTWalsheimPro",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: GestureDetector(
                                      onTap: () {
                                        Clipboard.setData(const ClipboardData(
                                                text: "inviteLink"))
                                            .then((value) {
                                          //only if ->
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text("Copied")));
                                        });
                                      },
                                      child: const Icon(
                                        Icons.copy,
                                        size: 12,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 83, top: 5),
                            child: Row(
                              children: [
                                const Text(
                                  "SL",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF003D21),
                                    fontFamily: "GTWalsheimPro",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  " - ",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF003D21),
                                    fontFamily: "GTWalsheimPro",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "Open",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF003D21),
                                    fontFamily: "GTWalsheimPro",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: GestureDetector(
                                      onTap: () {
                                        Clipboard.setData(const ClipboardData(
                                                text: "inviteLink"))
                                            .then((value) {
                                          //only if ->
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text("Copied")));
                                        });
                                      },
                                      child: const Icon(
                                        Icons.copy,
                                        size: 12,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          const ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Apply Proper Risk Management",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontFamily: "GTWalsheimPro",
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 250.0,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(10), // Image border
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(180), // Image radius
                                child: Image.asset("assets/images/feeds.jpg",
                                    fit: BoxFit.cover),
                              ),
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "An updated version of this tutorial exists! Angular devs can now use our dedicated Angular Chat SDK to build in-app messaging experiences faster than ever. You can still skim the post below for inspiration, but our new official Angular Chat App Tutorial is the place to find up-to-date info and a much simpler approach., textAlign: TextAlign.start",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF003D21),
                            fontFamily: "GTWalsheimPro",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const ButtonBar(
                        children: [
                          Text(
                            "Sunday, 27 February | 12:24AM",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF003D21),
                              fontFamily: "GTWalsheimPro",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
