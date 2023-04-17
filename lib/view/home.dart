import 'package:bloc1/component/appBarHome.dart';
import 'package:bloc1/component/detalisContainerHome.dart';
import 'package:bloc1/component/imageContainer.dart';
import 'package:bloc1/cubit/api_cubit.dart';
import 'package:bloc1/data/models.dart';

import 'package:bloc1/view/detailsPage.dart';
import 'package:bloc1/view/basket.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  List<Producte>? productes;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ApiCubit>(context).getDataModels();
  }

  @override
  Widget build(BuildContext context) {
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
        AppBarHome(),
        BlocBuilder<ApiCubit, ApiState>(
          builder: (context, state) {
            if (state is ApiData) {
              productes = state.data;
              return Expanded(
                child: ListView.builder(
                  itemCount: productes!.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetalisPage(producte: productes![i])));
                      },
                      child: Container(
                        height: height / 4.4,
                        margin: EdgeInsets.only(
                            right: right + 17,
                            left: left + 17,
                            top: top + 17,
                            bottom: bottom + 17),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 15),
                                  blurRadius: 25,
                                  color: Colors.black54),
                            ]),
                        child: Row(
                          children: [
                            ImageContainer(image: "${productes![i].image}"),
                            DetalisContainerHome(
                                title: "${productes![i].title}",
                                price: "${productes![i].price}")
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              );
            }
          },
        ),
      ],
    )));
  }
}
