import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_desk_challenge/base/http/HttpClient.dart';
import 'package:flutter_desk_challenge/base/vm/VMHeader.dart';
import 'package:flutter_desk_challenge/entity/weather_entity.dart';

class HomeViewModel extends ViewModel {
  StreamController<Weather_entity> weatherData = StreamController();

  Future<Response<dynamic>> getWeatherData() {
    return HttpClient.get().get(HttpClient.BASE_URL,
        queryParameters: {"city": "广州"}).then((value) {
      print(value.data);
      Weather_entity data = Weather_entity.fromJson(json.decode(value.data));
      weatherData.add(data);
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void onCleared() {
    super.onCleared();

    weatherData.close();
  }
}
