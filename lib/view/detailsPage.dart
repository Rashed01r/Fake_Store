import 'package:bloc1/cubit/api_cubit.dart';
import 'package:bloc1/data/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetalisPage extends StatelessWidget {
  final Producte producte;
  const DetalisPage({super.key, required this.producte});

  @override
  Widget build(BuildContext context) {
    var model = BlocProvider.of<ApiCubit>(context, listen: false);
    double top = MediaQuery.of(context).viewInsets.top;
    double right = MediaQuery.of(context).viewInsets.right;
    double left = MediaQuery.of(context).viewInsets.left;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back),
                  iconSize: width / 12,
                ),
                Container(
                  width: width / 1.3,
                  alignment: Alignment.center,
                  child: Text(
                    "${producte.category}",
                    style: TextStyle(
                        fontSize: width / 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 20,
            ),
            Center(
              child: Text(
                "${producte.title}",
                style: TextStyle(
                    fontSize: width / 19, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: height / 15,
            ),
            Image.network(
              producte.image.toString(),
              height: height / 4,
            ),
            SizedBox(
              height: height / 18,
            ),
            Text(
              "${producte.description}",
              style: TextStyle(fontSize: width / 22),
            ),
            SizedBox(
              height: height / 20,
            ),
            Container(
                margin: EdgeInsets.only(left: left + 8),
                child: Row(
                  children: [
                    Text(
                      "Price : ${producte.price}",
                      style: TextStyle(
                          fontSize: width / 18, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: left + 5, top: top + 5),
                      child: Text(
                        "(Inclusive of VAT)",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(left: left + 8, top: top + 13),
              child: Row(
                children: [
                  Text(
                    "Ratings : ",
                    style: TextStyle(
                        fontSize: width / 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${producte.rating!.rate}",
                    style: TextStyle(
                        fontSize: width / 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.star),
                  Text(
                    "(${producte.rating!.count})",
                    style: TextStyle(
                      fontSize: width / 22,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
            ElevatedButton(
              onPressed: () {
                model.addItem(producte);
              },
              child: Text("Add to cart"),
            ),
          ],
        ),
      ),
    );
  }
}
