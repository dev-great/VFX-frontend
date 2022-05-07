import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:vsf/screens/login_screen.dart';
import 'package:vsf/states/user_state.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String _oldPassword = '';
  String _password = '';
  String _confpassword = '';
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
    EasyLoading.showSuccess('Use in initState');
  }

  final _form = GlobalKey<FormState>();
  void _changePassword() async {
    var isvalid = _form.currentState?.validate();
    if (!isvalid!) {
      return;
    }
    _form.currentState?.save();
    bool isregis = await Provider.of<UserState>(
      context,
      listen: false,
    ).changePassword(
      _oldPassword,
      _password,
    );
    if (isregis) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginScreen(xOffSet: 0, yOffSet: 0)));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Something is wrong.Try Again"),
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
            child: Form(
              key: _form,
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
                                height: innerHeight * 0.89,
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
                                      top: 2, left: 20, right: 20),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(top: 40),
                                          child: Text(
                                            'Change Password',
                                            style: TextStyle(
                                              fontSize: 32,
                                              color: Color(0xFF003D21),
                                              fontFamily: "GTWalsheimPro",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Need a new password? reset your account password here!',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF003D21)
                                                .withOpacity(0.6),
                                            fontFamily: "GTWalsheimPro",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Container(
                                            height: 70,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.15,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: const Color(0xFFE5EFEA),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder.none,
                                                    iconColor:
                                                        Color(0xFF006838),
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    hintText:
                                                        "Enter Your old password",
                                                    hintStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xFF003D21),
                                                      fontFamily:
                                                          "GTWalsheimPro",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  obscureText: true,
                                                  onSaved: (v) {
                                                    _oldPassword = v!;
                                                  },
                                                  validator: (v) {
                                                    if (v!.isEmpty) {
                                                      return 'Enter Your old password';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Container(
                                            height: 70,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.15,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: const Color(0xFFE5EFEA),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder.none,
                                                    iconColor:
                                                        Color(0xFF006838),
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    hintText:
                                                        "Enter new password",
                                                    hintStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xFF003D21),
                                                      fontFamily:
                                                          "GTWalsheimPro",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  obscureText: true,
                                                  autocorrect: false,
                                                  enableSuggestions: false,
                                                  onChanged: (v) {
                                                    setState(() {
                                                      _confpassword = v;
                                                    });
                                                  },
                                                  onSaved: (v) {
                                                    _password = v!;
                                                  },
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
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Container(
                                            height: 70,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.15,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: const Color(0xFFE5EFEA)),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder.none,
                                                    iconColor:
                                                        Color(0xFF006838),
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    hintText:
                                                        "Confirm password",
                                                    hintStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xFF003D21),
                                                      fontFamily:
                                                          "GTWalsheimPro",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    helperStyle: TextStyle(
                                                      fontFamily:
                                                          "GTWalsheimPro",
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  obscureText: true,
                                                  autocorrect: false,
                                                  enableSuggestions: false,
                                                  onSaved: (v) {
                                                    _password = v!;
                                                  },
                                                  validator: (v) {
                                                    if (_confpassword != v) {
                                                      return 'Confirm password';
                                                    }
                                                    if (v!.isEmpty) {
                                                      return 'Confirm Your password';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 40),
                                          child: GestureDetector(
                                            onTap: () {
                                              _changePassword();
                                              _progress = 0;
                                              _timer?.cancel();
                                              _timer = Timer.periodic(
                                                  const Duration(
                                                      milliseconds: 100),
                                                  (Timer timer) {
                                                EasyLoading.showProgress(
                                                    _progress,
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
                                              height: 70,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.15,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xFF006838),
                                              ),
                                              child: const Center(
                                                  child: Text(
                                                "Update Profile",
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
                                      ],
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
          ),
        )
      ],
    );
  }
}
