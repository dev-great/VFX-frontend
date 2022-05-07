import 'package:flutter/material.dart';
import 'package:vsf/screens/login_screen.dart';
import 'package:vsf/screens/signup2_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email = '';
  String _confpassword = '';
  String _password = '';

  final _form = GlobalKey<FormState>();

  _continueNow() {
    var isvalid = _form.currentState?.validate();
    if (!isvalid!) {
      return;
    }
    _form.currentState?.save();
    if (isvalid) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SignUp2(
                    mail: _email,
                    pword: _password,
                  )));
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
                  const Image(
                    image: AssetImage("assets/logo/logo.png"),
                  ),
                  const Text(
                    "Sign up",
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
                              Icons.mail,
                              color: Color(0xFF006838),
                            ),
                            prefixStyle: TextStyle(color: Color(0xFF006838)),
                            focusedBorder: InputBorder.none,
                            hintText: "E-mail*",
                            helperStyle: TextStyle(
                              fontFamily: "GTWalsheimPro",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          onSaved: (v) {
                            _email = v!;
                          },
                          validator: (v) {
                            if (v!.isEmpty || v.contains('@') == false) {
                              return 'Enter a valid E-mail address';
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
                            hintText: " Confirm Password*",
                            helperStyle: TextStyle(
                              fontFamily: "GTWalsheimPro",
                              fontWeight: FontWeight.normal,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        _continueNow();
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
                          "Continue",
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
                            children: [
                              const Text(
                                "Already have an account?",
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
                                          builder: ((context) =>
                                              const LoginScreen(
                                                  xOffSet: 0, yOffSet: 0))));
                                },
                                child: const Text(
                                  "Log in",
                                  style: TextStyle(
                                    color: Color(0xFF8CC540),
                                    fontFamily: "GTWalsheimPro",
                                    fontWeight: FontWeight.bold,
                                  ),
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
