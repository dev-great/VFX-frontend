import 'package:flutter/material.dart';
import 'package:vsf/screens/payment_method.dart';
import 'package:vsf/screens/widget/sub_card.dart';

class SubscriptionPlan extends StatefulWidget {
  SubscriptionPlan({Key? key}) : super(key: key);

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
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
                  height: height * 1.3,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWidth = constraints.maxWidth;
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 1.5,
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
                                      left: 20, right: 20),
                                  child: Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        const Text(
                                          'Subscription plans',
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Color(0xFF003D21),
                                            fontFamily: "GTWalsheimPro",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          'Select a suitable plan to continue',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFF003D21),
                                            fontFamily: "GTWalsheimPro",
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const PaymentMethod(
                                                          id: 1,
                                                          title: "Monthly VIP",
                                                          image:
                                                              "assets/images/feeds.jpg",
                                                          price: "50",
                                                          color:
                                                              Color(0xFF2D314B),
                                                        )));
                                          },
                                          child: const SubCard(
                                              id: 1,
                                              title: "Monthly VIP",
                                              image: "assets/images/feeds.jpg",
                                              price: "50",
                                              color: Color(0xFF2D314B)),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PaymentMethod(
                                                          id: 2,
                                                          title: "II Month VIP",
                                                          image:
                                                              "assets/images/feeds.jpg",
                                                          price: "80",
                                                          color: Color(
                                                              0xFFE66565)),
                                                ));
                                          },
                                          child: const SubCard(
                                              id: 2,
                                              title: "II Month VIP",
                                              image: "assets/images/feeds.jpg",
                                              price: "80",
                                              color: Color(0xFFE66565)),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PaymentMethod(
                                                          id: 3,
                                                          title: "6 Month VIP",
                                                          image:
                                                              "assets/images/feeds.jpg",
                                                          price: "150",
                                                          color: Color(
                                                              0xFFD87856)),
                                                ));
                                          },
                                          child: const SubCard(
                                              id: 3,
                                              title: "6 Month VIP",
                                              image: "assets/images/feeds.jpg",
                                              price: "150",
                                              color: Color(0xFFD87856)),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PaymentMethod(
                                                          id: 4,
                                                          title: "1 Year VIP",
                                                          image:
                                                              "assets/images/feeds.jpg",
                                                          price: "200",
                                                          color: Color(
                                                              0xFF4B3D83)),
                                                ));
                                          },
                                          child: const SubCard(
                                              id: 4,
                                              title: "1 Year VIP",
                                              image: "assets/images/feeds.jpg",
                                              price: "200",
                                              color: Color(0xFF4B3D83)),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PaymentMethod(
                                                          id: 5,
                                                          title: "Lifetime VIP",
                                                          image:
                                                              "assets/images/feeds.jpg",
                                                          price: "400",
                                                          color: Color(
                                                              0xFF8CC540)),
                                                ));
                                          },
                                          child: const SubCard(
                                              id: 5,
                                              title: "Lifetime VIP",
                                              image: "assets/images/feeds.jpg",
                                              price: "400",
                                              color: Color(0xFF8CC540)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
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
