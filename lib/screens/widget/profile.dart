import 'package:flutter/material.dart';
import 'package:vsf/screens/change_password.dart';
import 'package:vsf/screens/edit_profile.dart';
import 'package:vsf/screens/get_started_screen.dart';
import 'package:vsf/screens/subscription_plans.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            color: Colors.grey.withOpacity(0.1),
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
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: innerHeight * 0.86,
                              width: innerWidth,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 80,
                                  ),
                                  const Text(
                                    'Greatness Marshal',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0xFF003D21),
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'gmarshal070@gmail.com',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF003D21),
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 12, right: 12),
                                    child: Container(
                                      height: 150,
                                      width: 326,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF2D314B),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 12),
                                            child: SizedBox(
                                                height: 104.0,
                                                width: 71,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10), // Image border
                                                  child: SizedBox.fromSize(
                                                    child: Image.asset(
                                                        "assets/images/user.png",
                                                        fit: BoxFit.cover),
                                                  ),
                                                )),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20, top: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                SubscriptionPlan()));
                                                  },
                                                  child: const Text(
                                                    'Monthly VIP',
                                                    style: TextStyle(
                                                      fontSize: 32,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          "GTWalsheimPro",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                                Row(
                                                  children: const [
                                                    Text(
                                                      'Start date:',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            "GTWalsheimPro",
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      '12-05-2022',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            "GTWalsheimPro",
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: const [
                                                    Text(
                                                      'Expiry date:',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            "GTWalsheimPro",
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      '12-06-2022',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            "GTWalsheimPro",
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfile()));
                                      },
                                      child: Container(
                                        height: 70,
                                        width: 326,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFE5EFEA),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditProfile()));
                                                },
                                                child: Container(
                                                    height: 38,
                                                    width: 38,
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child:
                                                        Stack(children: const [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Icon(
                                                            Icons.auto_fix_high,
                                                            color: Color(
                                                                0xFF006838)),
                                                      ),
                                                    ])),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            const Text(
                                              'Edit Profile',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xFF003D21),
                                                fontFamily: "GTWalsheimPro",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15),
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Color(0xFF003D21),
                                                size: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChangePassword()));
                                      },
                                      child: Container(
                                        height: 70,
                                        width: 326,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFE5EFEA),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Container(
                                                  height: 38,
                                                  width: 38,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Stack(children: const [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Icon(
                                                          Icons.password,
                                                          color: Color(
                                                              0xFF006838)),
                                                    ),
                                                  ])),
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            const Text(
                                              'Change Password',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xFF003D21),
                                                fontFamily: "GTWalsheimPro",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15),
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Color(0xFF003D21),
                                                size: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const OnboardingScreen()));
                                      },
                                      child: Container(
                                        height: 70,
                                        width: 326,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFE5EFEA),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Container(
                                                  height: 38,
                                                  width: 38,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Stack(children: const [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Icon(
                                                          Icons.notifications,
                                                          color: Color(
                                                              0xFF006838)),
                                                    ),
                                                  ])),
                                            ),
                                            const SizedBox(
                                              width: 40,
                                            ),
                                            const Text(
                                              'Notification',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xFF003D21),
                                                fontFamily: "GTWalsheimPro",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15),
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Color(0xFF003D21),
                                                size: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 45,
                            right: 125,
                            child: CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.grey.withOpacity(0.2)),
                          ),
                          const Positioned(
                            top: 50,
                            right: 130,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  AssetImage("assets/images/user.png"),
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
