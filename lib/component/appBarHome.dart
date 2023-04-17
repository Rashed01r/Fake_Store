import 'package:bloc1/cubit/api_cubit.dart';
import 'package:bloc1/view/basket.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double top = MediaQuery.of(context).viewInsets.top;
    double right = MediaQuery.of(context).viewInsets.right;
    double left = MediaQuery.of(context).viewInsets.left;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: left + 30),
          child: Text(
            "Welocome to Store",
            style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold, shadows: [
              BoxShadow(
                  offset: Offset(0, 4), blurRadius: 5, color: Colors.black54),
            ]),
          ),
        ),
        Spacer(),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Basket(),
                ));
              },
              icon: Icon(Icons.shopping_basket_outlined),
            ),
            BlocBuilder<ApiCubit, ApiState>(
              builder: (context, state) {
                if (state is ApiData) {
                  return Padding(
                    padding: EdgeInsets.only(top: top + 10, left: left + 5),
                    child: Container(child: Text("${state.paskit.length}")),
                  );
                } else {
                  return SizedBox();
                }
              },
            )
          ],
        ),
      ],
    );
  }
}
