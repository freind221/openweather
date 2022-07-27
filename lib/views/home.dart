import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openweather/services/binding.dart';
import 'package:openweather/controllers/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
  static RxString city = ''.obs;
}

class _HomePageState extends State<HomePage> {
  final WeatherController weatherController =
      Get.put((WeatherController(city: HomePage.city)));

  @override
  Widget build(BuildContext context) {
    print('--------widget tree--------');
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: Text(
            "WeatherApp",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: GetBuilder<WeatherController>(builder: (controller) {
        return Column(
          children: [
            TextField(
              controller: controller.editingController1,
              onChanged: (value) {
                HomePage.city = value.obs;
                controller.updateCity(HomePage.city);
                controller.fetchProducts();
              },
              decoration: const InputDecoration(labelText: 'City'),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: (() {
                  controller.fetchProducts();
                  Get.snackbar('Clouds', '${controller.data?.main?.feelsLike}');
                }),
                child: const Text('Search')),
          ],
        );
      }),
    );
  }
}
