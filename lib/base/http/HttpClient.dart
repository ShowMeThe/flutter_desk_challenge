import 'dart:collection';

import 'package:dio/dio.dart';

class HttpClient {

  static const BASE_URL = "http://wthrcdn.etouch.cn/weather_mini";
  static const _TIMEOUT = 15000;
  static Dio _dio;
  static Map _map = HashMap<String,dynamic>();
  static BaseOptions _option = BaseOptions(
  baseUrl: BASE_URL,
  sendTimeout: _TIMEOUT,
  connectTimeout: _TIMEOUT,
  receiveTimeout: _TIMEOUT);

  static Dio get(){
    if(_dio == null){
      _dio = Dio(_option);
    }
    return _dio;
  }



  static updateHeader(String cookie){
    print("updateHeader = $cookie");
    _map["Cookie"] = "JSESSIONID=$cookie";
    _option.headers = _map;

  }


}