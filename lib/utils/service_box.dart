import 'package:flutter/material.dart';

class ServiceDisplay extends StatelessWidget {
  final String name;
  final String gender;
  final String imageUrl;
  final num price;
  final VoidCallback onTap;
  const ServiceDisplay(
      this.name, this.gender, this.imageUrl, this.price, this.onTap,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 5),
        height: 140,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: Image.network(
                      imageUrl,
                      height: 130,
                      width: 130,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Name   : ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(' $name', style: const TextStyle(fontSize: 18))
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Gender : ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(' $gender', style: const TextStyle(fontSize: 18))
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            'Price    : ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(' Rs $price', style: const TextStyle(fontSize: 18))
                        ],
                      ),
                    ],
                  ),
                  /*Icon(
                    Icons.format_align_justify_outlined,
                    size: 30,
                  )*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
