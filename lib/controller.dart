// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:openweather/model.dart';
// import 'package:openweather/service.dart';

// class WeatherController extends GetxController {
//   final _controller = TextEditingController();
//   var list = [].obs;
//   final RemoteService weathers = RemoteService();
//   var isLoading = true.obs;

//   @override
//   void onInit() {
//     fetchdata();
//     super.onInit();
//   }

//   void fetchdata() async {
//     isLoading(true);
//     var weth = await RemoteService.getWeather(_controller.text);
//     list.addAll(weth);
//   }
// }

import 'package:get/get.dart';
import 'package:openweather/model.dart';
import 'package:openweather/service.dart';

class WeatherController extends GetxController {
  var data = Weather();
  String city;
  WeatherController({required this.city});

  @override
  void onInit() {
    super.onInit();

    fetchProducts();
  }

  void fetchProducts() async {
    var weather = await RemoteService.getWeather(city);
    if (weather != null) {
      data = weather;
      update();
    }
  }
}
