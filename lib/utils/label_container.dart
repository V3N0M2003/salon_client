import 'package:flutter/material.dart';

class Labelcontainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback ontap;
  const Labelcontainer(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 70,
        width: 350,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(4, 4))]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Icon(
                  icon,
                  size: 40,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 13)),
                      Text(
                        title,
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      )
                    ],
                  ),
                ),
              ]),
            ),
            Icon(
              Icons.arrow_circle_right_outlined,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
