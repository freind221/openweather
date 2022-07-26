// {

//   "weather": [
//     {
//       "id": 800,
//       "main": "Clear",
//       "description": "clear sky",
//       "icon": "01d"
//     }
//   ],

//   "main": {
//     "temp": 282.55,

//     "temp_min": 280.37,
//     "temp_max": 284.26,

//   "name": "Mountain View",

//   }

// class WeatherResponse {
//   final String cityName;
//   final TempratureInfo tempInfo;
//   final WeatherInfo weatherInfo;

//   WeatherResponse(
//       {required this.cityName,
//       required this.tempInfo,
//       required this.weatherInfo});
//   factory WeatherResponse.fromJson(Map<String, dynamic> json) {
//     final cityName = json['name'];
//     final tempInfoJson = json['main'];
//     final tempInfo = TempratureInfo.fromJson(tempInfoJson);

//     final weatherInfoJson = json['weather'][0];
//     final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);
//     return WeatherResponse(
//         cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
//   }
// }

// class TempratureInfo {
//   final double temprature;
//   TempratureInfo({required this.temprature});
//   factory TempratureInfo.fromJson(Map<String, dynamic> json) {
//     final temprature = json['temp'];
//     return TempratureInfo(temprature: temprature);
//   }
// }

// class WeatherInfo {
//   final String description;
//   final String icon;
//   WeatherInfo({required this.description, required this.icon});
//   factory WeatherInfo.fromJson(Map<String, dynamic> json) {
//     final description = json['description'];
//     final icon = json['icon'];
//     return WeatherInfo(description: description, icon: icon);
//   }
// }

class Weather {
  Coord? coord;
  List<Weather1>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  dynamic cod;

  Weather(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  Weather.fromJson(Map<String, dynamic> json) {
    coord = json["coord"] == null ? null : Coord.fromJson(json["coord"]);
    weather = json["weather"] == null
        ? null
        : (json["weather"] as List).map((e) => Weather1.fromJson(e)).toList();
    base = json["base"];
    main = json["main"] == null ? null : Main.fromJson(json["main"]);
    visibility = json["visibility"];
    wind = json["wind"] == null ? null : Wind.fromJson(json["wind"]);
    clouds = json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]);
    dt = json["dt"];
    sys = json["sys"] == null ? null : Sys.fromJson(json["sys"]);
    timezone = json["timezone"];
    id = json["id"];
    name = json["name"];
    cod = json["cod"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data["coord"] = coord?.toJson();
    }
    if (weather != null) {
      data["weather"] = weather?.map((e) => e.toJson()).toList();
    }
    data["base"] = base;
    if (main != null) {
      data["main"] = main?.toJson();
    }
    data["visibility"] = visibility;
    if (wind != null) {
      data["wind"] = wind?.toJson();
    }
    if (clouds != null) {
      data["clouds"] = clouds?.toJson();
    }
    data["dt"] = dt;
    if (sys != null) {
      data["sys"] = sys?.toJson();
    }
    data["timezone"] = timezone;
    data["id"] = id;
    data["name"] = name;
    data["cod"] = cod;
    return data;
  }
}

class Sys {
  int? type;
  int? id;
  double? message;
  String? country;
  int? sunrise;
  int? sunset;

  Sys(
      {this.type,
      this.id,
      this.message,
      this.country,
      this.sunrise,
      this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    id = json["id"];
    message = json["message"];
    country = json["country"];
    sunrise = json["sunrise"];
    sunset = json["sunset"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["type"] = type;
    data["id"] = id;
    data["message"] = message;
    data["country"] = country;
    data["sunrise"] = sunrise;
    data["sunset"] = sunset;
    return data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json["all"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["all"] = all;
    return data;
  }
}

class Wind {
  double? speed;
  int? deg;

  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json["speed"];
    deg = json["deg"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["speed"] = speed;
    data["deg"] = deg;
    return data;
  }
}

class Main {
  double? temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  int? pressure;
  int? humidity;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json["temp"];
    feelsLike = json["feels_like"];
    tempMin = json["temp_min"];
    tempMax = json["temp_max"];
    pressure = json["pressure"];
    humidity = json["humidity"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["temp"] = temp;
    data["feels_like"] = feelsLike;
    data["temp_min"] = tempMin;
    data["temp_max"] = tempMax;
    data["pressure"] = pressure;
    data["humidity"] = humidity;
    return data;
  }
}

class Weather1 {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather1({this.id, this.main, this.description, this.icon});

  Weather1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    main = json["main"];
    description = json["description"];
    icon = json["icon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["main"] = main;
    data["description"] = description;
    data["icon"] = icon;
    return data;
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json["lon"];
    lat = json["lat"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["lon"] = lon;
    data["lat"] = lat;
    return data;
  }
}
