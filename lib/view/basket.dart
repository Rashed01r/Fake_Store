import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc1/component/containerBasket.dart';
import 'package:bloc1/cubit/api_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Basket extends StatelessWidget {
  const Basket({super.key});

  @override
  Widget build(BuildContext context) {
    var netWork = BlocProvider.of<ApiCubit>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double top = MediaQuery.of(context).viewInsets.top;
    double right = MediaQuery.of(context).viewInsets.right;
    double left = MediaQuery.of(context).viewInsets.left;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_outlined)),
                Padding(
                  padding: EdgeInsets.only(left: left + 113),
                  child: Text(
                    "Basket",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 5,
                              color: Colors.black54),
                        ]),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height / 25,
            ),
            ContainerBasket(),
            BlocBuilder<ApiCubit, ApiState>(
              builder: (context, state) {
                if (state is ApiData) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.only(
                                  left: left + 10, top: top + 50),
                              child: Text(
                                "The total amount : ${state.price}",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )),
                          Container(
                            padding:
                                EdgeInsets.only(left: left + 5, top: top + 50),
                            child: Text(
                              "(Inclusive of VAT)",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: top + 25),
                        child: ElevatedButton(
                            onPressed: () {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.bottomSlide,
                                showCloseIcon: true,
                                title: "Success",
                                desc: "Payment completed successfully",
                                btnOkOnPress: () {},
                              ).show();
                            },
                            child: Text("Complete the payment"),
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              backgroundColor: Colors.green,
                              elevation: 10,
                            )),
                      )
                    ],
                  );
                } else {
                  return SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
