import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final String category;
  final String imagepath;
  final VoidCallback onTap;

  const CategoryContainer(this.category, this.imagepath, this.onTap,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 110,
          height: 180,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              border: Border.all(width: 1),
              boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(4, 4))]),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10),
              ),
              Container(
                width: 60,
                height: 60,
                child: Image.asset(
                  '$imagepath',
                  height: 50,
                  width: 50,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  //border: Border.all(width: 0.7)
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10),
              ),
              Text(
                '$category',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              IconButton(
                iconSize: 30,
                icon: Icon(Icons.arrow_circle_right),
                onPressed: () {},
              )
            ],
          )),
    );
  }
}
