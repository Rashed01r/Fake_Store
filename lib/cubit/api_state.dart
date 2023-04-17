part of 'api_cubit.dart';

@immutable
abstract class ApiState {}

class ApiInitial extends ApiState {}

class ApiData extends ApiState {
  final List<Producte> data;
  final List<Producte> paskit;
  final num price;

  ApiData({required this.data, required this.paskit, required this.price});
}
