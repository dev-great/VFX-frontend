import 'package:flutter/material.dart';
import 'package:vsf/models/contect_model.dart';
import 'package:vsf/screens/login_screen.dart';
import 'package:vsf/screens/signup_screen.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        const Center(
                          child: Image(
                            height: 120,
                            width: 120,
                            image: AssetImage("assets/logo/logo.png"),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Text(
                                  "${contents[i].btn}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF006838),
                                    fontFamily: "GTWalsheimPro",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image(
                      height: MediaQuery.of(context).size.height / 2.9,
                      width: MediaQuery.of(context).size.width / 0.3,
                      image: AssetImage(
                        "${contents[i].image}",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "${contents[i].title}",
                            style: const TextStyle(
                              fontSize: 35,
                              color: Color(0xFF006838),
                              fontFamily: "GTWalsheimPro",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          contents.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 15),
                          child: SizedBox(
                            height: 60,
                            width:
                                currentIndex == contents.length - 1 ? 300 : 150,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFF006838),
                                ),
                                child: Center(
                                  child: Text(
                                    currentIndex == contents.length - 1
                                        ? "Continue"
                                        : "Next",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (currentIndex == contents.length - 1) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const LoginScreen(
                                        xOffSet: 0,
                                        yOffSet: 0,
                                      ),
                                    ),
                                  );
                                }
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.bounceIn,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 8,
      width: currentIndex == index || currentIndex == index - 1 ? 30 : 50,
      decoration: BoxDecoration(
          color: currentIndex == index ||
                  currentIndex == index + 1 ||
                  currentIndex == index + 2
              ? const Color(0xFF006838)
              : const Color(0xFFE5EFEA)),
    );
  }
}
