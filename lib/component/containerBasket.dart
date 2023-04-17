import 'package:bloc1/cubit/api_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerBasket extends StatelessWidget {
  const ContainerBasket({super.key});

  @override
  Widget build(BuildContext context) {
    var netWork = BlocProvider.of<ApiCubit>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double top = MediaQuery.of(context).viewInsets.top;
    double right = MediaQuery.of(context).viewInsets.right;
    double left = MediaQuery.of(context).viewInsets.left;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    return BlocBuilder<ApiCubit, ApiState>(
      builder: (context, state) {
        if (state is ApiData) {
          return Container(
            width: width,
            height: 400,
            child: ListView.builder(
              itemCount: state.paskit.length,
              itemBuilder: (context, i) {
                return Container(
                  height: height / 5.5,
                  child: Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Image.network(
                            "${state.paskit[i].image}",
                            width: width / 2.5,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(
                                      top: top + 15, left: left + 5),
                                  child: Text(
                                    "${state.paskit[i].title}",
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: top + 8, left: left + 5),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Price : ${state.paskit[i].price}",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                netWork.remove(state.paskit[i]);
                              },
                              icon: Icon(
                                Icons.remove_circle_outline_outlined,
                                color: Colors.red,
                              ))
                        ],
                      )),
                );
              },
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
