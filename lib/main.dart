import 'package:bloc1/cubit/api_cubit.dart';
import 'package:bloc1/data/repositrory.dart';
import 'package:bloc1/data/webService.dart';
import 'package:bloc1/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ApiCubit(repository: Repository(webService: WebService())),
      child: MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
