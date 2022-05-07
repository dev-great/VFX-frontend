import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _username = '';
  final _form = GlobalKey<FormState>();
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
            child: Column(
              children: [
                SizedBox(
                  height: height,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWidth = constraints.maxWidth;
                      return Form(
                        key: _form,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.79,
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        height: 70,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0xFFE5EFEA),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                iconColor: Color(0xFF006838),
                                                focusedBorder: InputBorder.none,
                                                hintText: "Greatness Marshal",
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF003D21),
                                                  fontFamily: "GTWalsheimPro",
                                                  fontWeight: FontWeight.w500,
                                                ),
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
                                                  return 'Enter Your E-mail';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Container(
                                        height: 70,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0xFFE5EFEA),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                iconColor: Color(0xFF006838),
                                                focusedBorder: InputBorder.none,
                                                hintText:
                                                    "gmarshal070@gmail.com",
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF003D21),
                                                  fontFamily: "GTWalsheimPro",
                                                  fontWeight: FontWeight.w500,
                                                ),
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
                                                  return 'Enter Your Full name';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Container(
                                        height: 70,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.15,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xFFE5EFEA)),
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                iconColor: Color(0xFF006838),
                                                focusedBorder: InputBorder.none,
                                                hintText: "08100808038",
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF003D21),
                                                  fontFamily: "GTWalsheimPro",
                                                  fontWeight: FontWeight.w500,
                                                ),
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
                                                  return 'Enter Your Full name';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 40),
                                      child: Container(
                                        height: 70,
                                        width:
                                            MediaQuery.of(context).size.width /
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
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 80,
                              right: 125,
                              child: CircleAvatar(
                                  radius: 60,
                                  backgroundColor:
                                      Colors.grey.withOpacity(0.2)),
                            ),
                            const Positioned(
                              top: 85,
                              right: 130,
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.black,
                                backgroundImage:
                                    AssetImage("assets/images/user.png"),
                              ),
                            ),
                            Positioned(
                                top: 105,
                                right: 170,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.camera,
                                      color: Color(0xFFFFFFFF),
                                      size: 50,
                                    ))),
                          ],
                        ),
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
