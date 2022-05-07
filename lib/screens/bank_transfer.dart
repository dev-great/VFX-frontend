import 'package:flutter/material.dart';
import 'package:vsf/screens/widget/sub_card.dart';

class BankTransfer extends StatefulWidget {
  final int id;
  final String title;
  final String image;
  final String price;
  final Color color;
  BankTransfer(
      {Key? key,
      required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.color})
      : super(key: key);

  @override
  State<BankTransfer> createState() => _BankTransferState();
}

class _BankTransferState extends State<BankTransfer> {
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
                  height: height,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWidth = constraints.maxWidth;
                      return Stack(fit: StackFit.expand, children: [
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    widget.title,
                                    style: const TextStyle(
                                      fontSize: 30,
                                      color: Color(0xFF003D21),
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: SubCard(
                                        id: widget.id,
                                        title: widget.title,
                                        image: widget.image,
                                        price: widget.price,
                                        color: widget.color),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Tansfer to the following Bank details',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF003D21).withOpacity(0.6),
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    'Account Name',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF003D21).withOpacity(0.6),
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'VFX Services',
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Color(0xFF003D21),
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    'Account Number',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF003D21).withOpacity(0.6),
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    '0202525220',
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Color(0xFF003D21),
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    'Bank Name',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF003D21).withOpacity(0.6),
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'First Bank Of Nigeria',
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: Color(0xFF003D21),
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    'Nigerian Conversion Rate  ₦580/\$1',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF003D21).withOpacity(0.6),
                                      fontFamily: "GTWalsheimPro",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]);
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
