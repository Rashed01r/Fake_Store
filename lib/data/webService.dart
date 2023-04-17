import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:bloc1/data/models.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<List<dynamic>?> getDataModels() async {
    const url = 'https://fakestoreapi.com/products';
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);

        return responsebody;
      } else {
        print("no servier");
      }
    } on SocketException {
      print("No Net");
    } on FormatException {
      print("json error");
    } catch (e) {
      print(e);
    }
    return null;
  }
}
