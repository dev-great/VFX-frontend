import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vsf/screens/home_screen.dart';
import 'package:vsf/screens/signup_screen.dart';
import 'package:vsf/states/user_state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginScreen extends StatefulWidget {
  final double xOffSet;
  final double yOffSet;
  final String? title;

  const LoginScreen({
    Key? key,
    required this.xOffSet,
    required this.yOffSet,
    this.title,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  String _username = '';
  String _password = '';
  final _form = GlobalKey<FormState>();
  Timer? _timer;
  late double _progress;

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    EasyLoading.showSuccess('Connection established');
  }

  void _loginNew() async {
    _isLoading = true;
    var isvalid = _form.currentState?.validate();
    if (!isvalid!) {
      return;
    }
    _form.currentState?.save();
    bool istoken = await Provider.of<UserState>(
      context,
      listen: false,
    ).loginNow(_username, _password);
    if (istoken) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                  "Incorrect Log In credentials. Confirm your username and password again!"),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF006838),
            )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Center(
            child: Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                      bottom: 10,
                    ),
                    child: Transform.translate(
                      offset: Offset(widget.xOffSet, widget.yOffSet),
                      child: const Image(
                        image: AssetImage("assets/logo/logo.png"),
                      ),
                    ),
                  ),
                  const Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 33,
                      color: Color(0xFF006838),
                      fontFamily: "GTWalsheimPro",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFE3F3F0),
                      ),
                      child: Center(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            iconColor: Color(0xFF006838),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xFF006838),
                            ),
                            prefixStyle: TextStyle(color: Color(0xFF006838)),
                            focusedBorder: InputBorder.none,
                            hintText: "Username*",
                            helperStyle: TextStyle(
                              fontFamily: "GTWalsheimPro",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onSaved: (v) {
                            _username = v!;
                          },
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Enter Your Username';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFE3F3F0),
                      ),
                      child: Center(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            iconColor: Color(0xFF006838),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xFF006838),
                            ),
                            prefixStyle: TextStyle(color: Color(0xFF006838)),
                            focusedBorder: InputBorder.none,
                            hintText: "Password*",
                            helperStyle: TextStyle(
                              fontFamily: "GTWalsheimPro",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onSaved: (v) {
                            _password = v!;
                          },
                          obscureText: true,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Enter Your password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        _loginNew();
                        _progress = 0;
                        _timer?.cancel();
                        _timer = Timer.periodic(
                            const Duration(milliseconds: 100), (Timer timer) {
                          EasyLoading.showProgress(_progress,
                              status:
                                  '${(_progress * 100).toStringAsFixed(0)}%');
                          _progress += 0.03;

                          if (_progress >= 1) {
                            _timer?.cancel();
                            EasyLoading.dismiss();
                          }
                        });
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF006838),
                        ),
                        child: const Center(
                            child: Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: "GTWalsheimPro",
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Alternative Login",
                          style: TextStyle(
                            fontFamily: "GTWalsheimPro",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 8),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF8CC540),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.facebook,
                                          color: Colors.white)),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF8CC540),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.apple_rounded,
                                            color: Colors.white))),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontFamily: "GTWalsheimPro",
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUp()));
                                },
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: Color(0xFF8CC540),
                                    fontFamily: "GTWalsheimPro",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
