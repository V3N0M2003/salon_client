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
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 23,
      //padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          border: Border.all(width: 0.7),
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(4, 4))
          ]),
      child: Column(
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(imageUrl, height: 150, width: 150),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //SizedBox(height: 10),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Service Name :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        ' $name',
                        style: const TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Section : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        gender,
                        style: const TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                  //Text("Service Name : $servicename"),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Price : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        price.toString(),
                        style: const TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  border: Border.all(width: 0.7),
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, offset: Offset(4, 4))
                  ]),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Book now",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
