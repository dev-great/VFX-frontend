import 'package:flutter/material.dart';
import 'package:vsf/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _splash();
  }

  _splash() async {
    await Future.delayed(const Duration(milliseconds: 4000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const MainScreen(
                xOffSet: 0,
                yOffSet: 160,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 3000),
        child: const Center(
            child: FadeInImage(
                fadeOutDuration: Duration(milliseconds: 1500),
                fadeOutCurve: Curves.bounceInOut,
                fadeInDuration: Duration(milliseconds: 1000),
                fadeInCurve: Curves.decelerate,
                placeholder: AssetImage("assets/logo/logo.png"),
                image: AssetImage("assets/logo/logo.png"))),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final double xOffSet;
  final double yOffSet;

  const MainScreen({
    Key? key,
    required this.xOffSet,
    required this.yOffSet,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    _splash();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
  }

  _splash() async {
    await Future.delayed(const Duration(milliseconds: 250), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.white,
      duration: const Duration(milliseconds: 10),
      child: Transform.translate(
        offset: Offset(widget.xOffSet, widget.yOffSet),
        child: FadeTransition(
          opacity: _fadeInFadeOut,
          child: const Image(
            image: AssetImage("assets/logo/logo.png"),
          ),
        ),
      ),
    );
  }
}
