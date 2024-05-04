import 'package:app2/model/curreny_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CurrencyService {
  static Future<dynamic> getCurrency() async {
    try {
      Response response = await Dio().get(
        "https://nbu.uz/uz/exchange-rates/json/",
      );

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CurrenyModel.fromJson(e))
            .toList();
      } else {
        debugPrint(response.statusMessage);
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      return e.message.toString();
    }
  }
}
