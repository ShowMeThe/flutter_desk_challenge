/// data : {"yesterday":{"date":"1日星期二","high":"高温 3℃","fx":"东北风","low":"低温 -4℃","fl":"<![CDATA[1级]]>","type":"多云"},"city":"北京","forecast":[{"date":"2日星期三","high":"高温 3℃","fengli":"<![CDATA[2级]]>","low":"低温 -4℃","fengxiang":"北风","type":"晴"},{"date":"3日星期四","high":"高温 5℃","fengli":"<![CDATA[3级]]>","low":"低温 -4℃","fengxiang":"西北风","type":"晴"},{"date":"4日星期五","high":"高温 4℃","fengli":"<![CDATA[3级]]>","low":"低温 -6℃","fengxiang":"西北风","type":"晴"},{"date":"5日星期六","high":"高温 4℃","fengli":"<![CDATA[1级]]>","low":"低温 -6℃","fengxiang":"北风","type":"晴"},{"date":"6日星期天","high":"高温 6℃","fengli":"<![CDATA[2级]]>","low":"低温 -4℃","fengxiang":"西北风","type":"晴"}],"ganmao":"感冒多发期，适当减少外出频率，适量补充水分，适当增减衣物。","wendu":"1"}
/// status : 1000
/// desc : "OK"

class Weather_entity {
  Data _data;
  int _status;
  String _desc;

  Data get data => _data;
  int get status => _status;
  String get desc => _desc;

  Weather_entity({
      Data data, 
      int status, 
      String desc}){
    _data = data;
    _status = status;
    _desc = desc;
}

  Weather_entity.fromJson(dynamic json) {
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    _status = json["status"];
    _desc = json["desc"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    map["status"] = _status;
    map["desc"] = _desc;
    return map;
  }

}

/// yesterday : {"date":"1日星期二","high":"高温 3℃","fx":"东北风","low":"低温 -4℃","fl":"<![CDATA[1级]]>","type":"多云"}
/// city : "北京"
/// forecast : [{"date":"2日星期三","high":"高温 3℃","fengli":"<![CDATA[2级]]>","low":"低温 -4℃","fengxiang":"北风","type":"晴"},{"date":"3日星期四","high":"高温 5℃","fengli":"<![CDATA[3级]]>","low":"低温 -4℃","fengxiang":"西北风","type":"晴"},{"date":"4日星期五","high":"高温 4℃","fengli":"<![CDATA[3级]]>","low":"低温 -6℃","fengxiang":"西北风","type":"晴"},{"date":"5日星期六","high":"高温 4℃","fengli":"<![CDATA[1级]]>","low":"低温 -6℃","fengxiang":"北风","type":"晴"},{"date":"6日星期天","high":"高温 6℃","fengli":"<![CDATA[2级]]>","low":"低温 -4℃","fengxiang":"西北风","type":"晴"}]
/// ganmao : "感冒多发期，适当减少外出频率，适量补充水分，适当增减衣物。"
/// wendu : "1"

class Data {
  Yesterday _yesterday;
  String _city;
  List<Forecast> _forecast;
  String _ganmao;
  String _wendu;

  Yesterday get yesterday => _yesterday;
  String get city => _city;
  List<Forecast> get forecast => _forecast;
  String get ganmao => _ganmao;
  String get wendu => _wendu;

  Data({
      Yesterday yesterday, 
      String city, 
      List<Forecast> forecast, 
      String ganmao, 
      String wendu}){
    _yesterday = yesterday;
    _city = city;
    _forecast = forecast;
    _ganmao = ganmao;
    _wendu = wendu;
}

  Data.fromJson(dynamic json) {
    _yesterday = json["yesterday"] != null ? Yesterday.fromJson(json["yesterday"]) : null;
    _city = json["city"];
    if (json["forecast"] != null) {
      _forecast = [];
      json["forecast"].forEach((v) {
        _forecast.add(Forecast.fromJson(v));
      });
    }
    _ganmao = json["ganmao"];
    _wendu = json["wendu"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_yesterday != null) {
      map["yesterday"] = _yesterday.toJson();
    }
    map["city"] = _city;
    if (_forecast != null) {
      map["forecast"] = _forecast.map((v) => v.toJson()).toList();
    }
    map["ganmao"] = _ganmao;
    map["wendu"] = _wendu;
    return map;
  }

}

/// date : "2日星期三"
/// high : "高温 3℃"
/// fengli : "<![CDATA[2级]]>"
/// low : "低温 -4℃"
/// fengxiang : "北风"
/// type : "晴"

class Forecast {
  String _date;
  String _high;
  String _fengli;
  String _low;
  String _fengxiang;
  String _type;

  String get date => _date;
  String get high => _high;
  String get fengli => _fengli;
  String get low => _low;
  String get fengxiang => _fengxiang;
  String get type => _type;

  Forecast({
      String date, 
      String high, 
      String fengli, 
      String low, 
      String fengxiang, 
      String type}){
    _date = date;
    _high = high;
    _fengli = fengli;
    _low = low;
    _fengxiang = fengxiang;
    _type = type;
}

  Forecast.fromJson(dynamic json) {
    _date = json["date"];
    _high = json["high"];
    _fengli = json["fengli"];
    _low = json["low"];
    _fengxiang = json["fengxiang"];
    _type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["date"] = _date;
    map["high"] = _high;
    map["fengli"] = _fengli;
    map["low"] = _low;
    map["fengxiang"] = _fengxiang;
    map["type"] = _type;
    return map;
  }

}

/// date : "1日星期二"
/// high : "高温 3℃"
/// fx : "东北风"
/// low : "低温 -4℃"
/// fl : "<![CDATA[1级]]>"
/// type : "多云"

class Yesterday {
  String _date;
  String _high;
  String _fx;
  String _low;
  String _fl;
  String _type;

  String get date => _date;
  String get high => _high;
  String get fx => _fx;
  String get low => _low;
  String get fl => _fl;
  String get type => _type;

  Yesterday({
      String date, 
      String high, 
      String fx, 
      String low, 
      String fl, 
      String type}){
    _date = date;
    _high = high;
    _fx = fx;
    _low = low;
    _fl = fl;
    _type = type;
}

  Yesterday.fromJson(dynamic json) {
    _date = json["date"];
    _high = json["high"];
    _fx = json["fx"];
    _low = json["low"];
    _fl = json["fl"];
    _type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["date"] = _date;
    map["high"] = _high;
    map["fx"] = _fx;
    map["low"] = _low;
    map["fl"] = _fl;
    map["type"] = _type;
    return map;
  }

}