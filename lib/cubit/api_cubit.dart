import 'package:bloc/bloc.dart';
import 'package:bloc1/data/models.dart';
import 'package:bloc1/data/repositrory.dart';
import 'package:bloc1/data/webService.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  final Repository repository;
  ApiCubit({required this.repository}) : super(ApiInitial());
  List<Producte> listItem = [];
  List<Producte> productes = [];
  double price = 0.0;

  List<Producte> getDataModels() {
    repository.getDataModels().then(
      (models) {
        this.productes = models;
        emit(ApiData(data: productes, paskit: listItem, price: price));
      },
    );

    return productes;
  }

  addItem(Producte producte) {
    listItem.add(producte);
    price += producte.price!;
    emit(ApiData(data: productes, paskit: listItem, price: price));
  }

  remove(Producte producte) {
    listItem.remove(producte);
    price -= producte.price!;
    emit(ApiData(data: productes, paskit: listItem, price: price));
  }
}
