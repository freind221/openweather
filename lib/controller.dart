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

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:openweather/model.dart';
import 'package:openweather/service.dart';

class WeatherController extends GetxController {
  Weather? data;
  var city = ''.obs;
  WeatherController({required this.city});

  // @override
  // void onInit() {
  //   updateCity(city);
  //   super.onInit();

  //   //fetchProducts();
  // }

  updateCity(RxString cityN) {
    city = cityN;
    update();
  }

  final editingController1 = TextEditingController();

  void fetchProducts() async {
    var weather = await RemoteService.getWeather(city.toString());
    if (weather != null) {
      data = weather;
      update();
    }
  }

  // @override
  // void dispose() {
  //   editingController1.dispose();
  //   super.dispose();
  // }
}
