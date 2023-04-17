import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ImageContainer extends StatelessWidget {
  final String image;
  const ImageContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double left = MediaQuery.of(context).viewInsets.left;

    return Container(
        width: width / 4.5,
        height: height / 5,
        margin: EdgeInsets.only(left: left + 10),
        child: FadeInImage.assetNetwork(
            placeholder: "images/loading.gif", image: image));
  }
}
