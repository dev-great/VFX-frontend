import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      color: Colors.white,
      backgroundColor: Colors.deepOrange,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child: Scaffold(
        body: Tawk(
          directChatLink:
              'https://tawk.to/chat/621abf5c1ffac05b1d7c0d68/1fss7n120',
          visitor: TawkVisitor(
            name: 'Greatness Marshal',
            email: 'gmarshal070@gmail.com',
          ),
          onLoad: () {
            print('Hello Tawk!');
          },
          onLinkTap: (String url) {
            print(url);
          },
          placeholder: const Center(
            child: Text('Loading...'),
          ),
        ),
      ),
    );
  }
}
