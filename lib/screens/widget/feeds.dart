import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vsf/states/feed_state.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  bool _init = true;
  bool _isLoding = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoding = await Provider.of<FeedState>(context).getFeeds();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final feeds = Provider.of<FeedState>(context).feeds;
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
                  children: [
                    const Text(
                      "Feeds",
                      style: TextStyle(
                          fontFamily: "GTWalsheimPro",
                          fontSize: 32,
                          color: Color(0xFF003D21),
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Welcome, Greatness!",
                        style: TextStyle(
                            fontFamily: "GTWalsheimPro",
                            fontSize: 17,
                            color: const Color(0xFF006838).withOpacity(0.5),
                            fontWeight: FontWeight.bold),
                      ),
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
          Provider.of<FeedState>(context, listen: false).getFeeds();
        },
        color: Color(0xFF003D21),
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
              toolbarHeight: 120,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Padding(
                  padding: const EdgeInsets.only(top: 55, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Feeds",
                        style: TextStyle(
                            fontFamily: "GTWalsheimPro",
                            fontSize: 32,
                            color: Color(0xFF003D21),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Welcome, Greatness!",
                          style: TextStyle(
                              fontFamily: "GTWalsheimPro",
                              fontSize: 17,
                              color: const Color(0xFF006838).withOpacity(0.5),
                              fontWeight: FontWeight.bold),
                        ),
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
                    child: feeds[i].id == feeds.length
                        ? Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1.0),
                              child: Center(
                                child: Center(
                                  child: Text(
                                    "Latest",
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
                            Card(
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(
                                          height: 250.0,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                10), // Image border
                                            child: SizedBox.fromSize(
                                              size: const Size.fromRadius(
                                                  180), // Image radius
                                              child: Image.network(
                                                  "http://192.168.43.196:8000${feeds[i].postImage}",
                                                  fit: BoxFit.cover),
                                            ),
                                          )),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(16.0),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        feeds[i].body.toString(),
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
                                          " ${DateFormat('MMM-E-d  h:mm a').format(DateTime.parse(feeds[i].publisheddate.toString()).toLocal())}",
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
                                ))
                          ])
                        : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 1),
                                child: Container(
                                    height: 250.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          10), // Image border
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(
                                            180), // Image radius
                                        child: Image.network(
                                            "http://192.168.43.196:8000${feeds[i].postImage}",
                                            fit: BoxFit.cover),
                                      ),
                                    )),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  feeds[i].body.toString(),
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
                                    " ${DateFormat('MMM-E-d  h:mm a').format(DateTime.parse(feeds[i].publisheddate.toString()).toLocal())}",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF003D21),
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                  );
                },
                childCount: feeds.length,
              ),
            ),
          ],
        ),
      ));
    }
    ;
  }
}
