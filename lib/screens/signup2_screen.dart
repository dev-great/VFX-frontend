import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:vsf/screens/otp_screen.dart';
import 'package:vsf/states/user_state.dart';

class SignUp2 extends StatefulWidget {
  final String mail;
  final String pword;
  const SignUp2({
    Key? key,
    required this.mail,
    required this.pword,
  }) : super(key: key);

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String _fullname = '';
    String _phonenumber = '';
    String _firstname = '';
    String _lastname = '';
    String _email = widget.mail;
    String _username = '';
    String _password = widget.pword;
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

    _registerNow() async {
      var isvalid = _form.currentState?.validate();
      if (!isvalid!) {
        return;
      }
      _form.currentState?.save();
      bool isregis = await Provider.of<UserState>(
        context,
        listen: false,
      ).registernow(
          _username,
          _password,
          _email,
          _lastname = _fullname.split(' ')[0].toString(),
          _firstname = _fullname.split(' ')[1].toString());
      await Provider.of<UserState>(
        context,
        listen: false,
      ).otpvalidate(_phonenumber);
      if (isregis) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OTPScreen(
                      email: _email,
                      phone: _phonenumber,
                    )));
        await Provider.of<UserState>(
          context,
          listen: false,
        ).otpmsg(_phonenumber);
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
                  const Image(
                    image: AssetImage("assets/logo/logo.png"),
                  ),
                  const Text(
                    "Account Setup",
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
                            hintText: "User name*",
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
                              Icons.person,
                              color: Color(0xFF006838),
                            ),
                            prefixStyle: TextStyle(color: Color(0xFF006838)),
                            focusedBorder: InputBorder.none,
                            hintText: "Fullname*",
                            helperStyle: TextStyle(
                              fontFamily: "GTWalsheimPro",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onSaved: (v) {
                            _fullname = v!;
                          },
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Enter Your Full name';
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
                              Icons.phone,
                              color: Color(0xFF006838),
                            ),
                            prefixStyle: TextStyle(color: Color(0xFF006838)),
                            focusedBorder: InputBorder.none,
                            hintText: "Phone number*",
                            helperStyle: TextStyle(
                              fontFamily: "GTWalsheimPro",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onSaved: (v) {
                            _phonenumber = v!;
                          },
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Enter your Phone number';
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
                        _registerNow();
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
                          "Finish",
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
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Alternative Signup",
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
                            children: const [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  fontFamily: "GTWalsheimPro",
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Log in",
                                style: TextStyle(
                                  color: Color(0xFF8CC540),
                                  fontFamily: "GTWalsheimPro",
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        )
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
