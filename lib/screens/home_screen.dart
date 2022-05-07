import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:vsf/screens/widget/feedback.dart';
import 'package:vsf/screens/widget/feeds.dart';
import 'package:vsf/screens/widget/notifications.dart';
import 'package:vsf/screens/widget/profile.dart';
import 'package:vsf/screens/widget/signals.dart';
import 'package:vsf/states/push_notify.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String notificationTitle = '';
  String notificationBody = '';
  String notificationData = '';

  @override
  void initState() {
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();

    firebaseMessaging.streamCtlr.stream.listen(_changeData);
    firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    firebaseMessaging.titleCtlr.stream.listen(_changeTitle);

    super.initState();
  }

  _changeData(String msg) => setState(() => notificationData = msg);
  _changeBody(String msg) => setState(() => notificationBody = msg);
  _changeTitle(String msg) => setState(() => notificationTitle = msg);

  int currentTab = 0;
  final List<Widget> screens = [
    const FeedScreen(),
    NotifyScreen(),
    const FeedBackScreen(),
    const ProfileScreen(),
    SignalScreen(),
  ];

  Widget currentScreen = const FeedScreen();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: notificationTitle.isNotEmpty
          ? Stack(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = SignalScreen();
                      currentTab = 4;
                    });
                  },
                  child: const Icon(
                    Icons.auto_graph_outlined,
                  ),
                  backgroundColor: const Color(0xFF006838),
                ),
                Positioned(
                  left: 40,
                  child: Stack(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 8,
                      ),
                      Positioned(
                        top: 3,
                        left: 1,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 6,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  currentScreen = SignalScreen();
                  currentTab = 4;
                  notificationTitle.isNotEmpty;
                });
              },
              child: const Icon(
                Icons.auto_graph_outlined,
              ),
              backgroundColor: const Color(0xFF006838),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNav(),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
    );
  }

  BottomAppBar bottomNav() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 45,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = const FeedScreen();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(Icons.home_rounded,
                              color: currentTab == 0
                                  ? const Color(0xFF006838)
                                  : Colors.grey),
                          Text(
                            "Home",
                            style: TextStyle(
                                color: currentTab == 0
                                    ? const Color(0xFF003D21)
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = NotifyScreen();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(Icons.notifications,
                              color: currentTab == 1
                                  ? const Color(0xFF006838)
                                  : Colors.grey),
                          Text(
                            "notify",
                            style: TextStyle(
                                color: currentTab == 1
                                    ? const Color(0xFF003D21)
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = const FeedBackScreen();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(Icons.feedback,
                              color: currentTab == 2
                                  ? const Color(0xFF006838)
                                  : Colors.grey),
                          Text(
                            "Feedback",
                            style: TextStyle(
                                color: currentTab == 2
                                    ? const Color(0xFF003D21)
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = const ProfileScreen();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.black,
                            backgroundImage:
                                AssetImage("assets/images/user.png"),
                          ),
                          Text(
                            "Account",
                            style: TextStyle(
                                color: currentTab == 3
                                    ? const Color(0xFF003D21)
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
