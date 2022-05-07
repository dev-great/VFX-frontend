import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vsf/states/notification_state.dart';

class NotifyScreen extends StatefulWidget {
  NotifyScreen({Key? key}) : super(key: key);

  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  bool _init = true;
  bool _isLoding = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoding =
          await Provider.of<NotificationState>(context).getNotifications();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<NotificationState>(context).notifications;
    if (!_isLoding) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Notifications",
                      style: TextStyle(
                          fontFamily: "GTWalsheimPro",
                          fontSize: 32,
                          color: Color(0xFF003D21),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              const Center(
                child: Image(image: AssetImage("assets/images/connecting.gif")),
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 4));
            Provider.of<NotificationState>(context, listen: false)
                .getNotifications();
          },
          color: const Color(0xFF003D21),
          backgroundColor: Colors.white,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: <Widget>[
              SliverAppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                toolbarHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Padding(
                    padding: const EdgeInsets.only(top: 55, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Notifications",
                          style: TextStyle(
                              fontFamily: "GTWalsheimPro",
                              fontSize: 32,
                              color: Color(0xFF003D21),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (ctx, i) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: notifications[i].id == notifications.length
                          ? Card(
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: Center(
                                    child: Center(
                                      child: Text(
                                        "New",
                                        style: TextStyle(
                                            fontFamily: "GTWalsheimPro",
                                            fontSize: 17,
                                            color: const Color(0xFF006838)
                                                .withOpacity(0.9),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 25),
                                  child: Flexible(
                                    child: Stack(
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  notifications[i]
                                                      .title
                                                      .toString(),
                                                  textAlign: TextAlign.start,
                                                  style: const TextStyle(
                                                    fontSize: 25,
                                                    color: Color(0xFF003D21),
                                                    fontFamily: "GTWalsheimPro",
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  notifications[i]
                                                      .body
                                                      .toString(),
                                                  textAlign: TextAlign.start,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFF003D21),
                                                    fontFamily: "GTWalsheimPro",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              ButtonBar(
                                                children: [
                                                  Text(
                                                    " ${DateFormat('MMM-E-d  h:mm a').format(DateTime.parse(notifications[i].date.toString()).toLocal())}",
                                                    textAlign: TextAlign.start,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xFF003D21),
                                                      fontFamily:
                                                          "GTWalsheimPro",
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ]),
                                        const Positioned(
                                            top: 10,
                                            left: 280,
                                            child: Icon(Icons.new_label,
                                                color: Colors.green)),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            )
                          : Card(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 25),
                                child: Flexible(
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              notifications[i].title.toString(),
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontSize: 25,
                                                color: Color(0xFF003D21),
                                                fontFamily: "GTWalsheimPro",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              notifications[i].body.toString(),
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF003D21),
                                                fontFamily: "GTWalsheimPro",
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          ButtonBar(
                                            children: [
                                              Text(
                                                " ${DateFormat('MMM-E-d  h:mm a').format(DateTime.parse(notifications[i].date.toString()).toLocal())}",
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
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
                                      const Positioned(
                                          top: 10,
                                          left: 280,
                                          child: Icon(Icons.new_label,
                                              color: Colors.green)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    );
                  },
                  childCount: notifications.length,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
