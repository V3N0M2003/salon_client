import 'package:flutter/material.dart';

class HistoryContainer extends StatelessWidget {
  final String date;
  final String time;
  final String servicename;
  final String category;
  final String imgUrl;
  final String price;
  const HistoryContainer(this.date, this.time, this.servicename, this.category,
      this.imgUrl, this.price,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      //padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          border: Border.all(width: 0.7),
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(4, 4))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SizedBox(height: 10),
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              child: Image.network(
                imgUrl,
                height: 250,
                width: 250,
              )),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Service Name :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(servicename)
            ],
          ),
          //Text("Service Name : $servicename"),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Category :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(category)
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Appointment date:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(date)
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Scheduled time:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(time)
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Amount paid:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(price)
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
