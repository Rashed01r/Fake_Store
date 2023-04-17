import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetalisContainerHome extends StatelessWidget {
 final String title;
 final String price;
  DetalisContainerHome({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double top = MediaQuery.of(context).viewInsets.top;
    double left = MediaQuery.of(context).viewInsets.left;
    return Expanded(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top: top + 40, left: left + 10),
            child: Text(
              title,
              style:
                  TextStyle(fontSize: width / 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: height / 70,
          ),
          Row(
            children: [
              SizedBox(
                width: width / 25,
                height: height / 20,
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: width / 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: width / 50,
              ),
              Text(
                "R.S",
                style: TextStyle(
                  fontSize: width / 19,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
