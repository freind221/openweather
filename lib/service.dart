import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:openweather/model.dart';

class RemoteService {
  static Future<Weather>? getWeather(String city) async {
    final query = {
      'q': city,
      'appid': 'abff424826d18877a06c6427881f858c',
      'units': 'imperial'
    };
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', query);

    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    return Weather.fromJson(json);
  }
}
