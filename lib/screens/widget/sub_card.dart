import 'package:flutter/material.dart';

class SubCard extends StatelessWidget {
  final int id;
  final String title;
  final String image;
  final String price;
  final Color color;

  const SubCard({
    Key? key,
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 150,
        width: 326,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: SizedBox(
                  height: 104.0,
                  width: 71,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Image border
                    child: SizedBox.fromSize(
                      child: Image.asset(image, fit: BoxFit.cover),
                    ),
                  )),
            ),
            const SizedBox(
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: "GTWalsheimPro",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Signal Accuracy',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: "GTWalsheimPro",
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '95%',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: "GTWalsheimPro",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    " \$ $price",
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: "GTWalsheimPro",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
