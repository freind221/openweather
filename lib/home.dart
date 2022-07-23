import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openweather/binding.dart';
import 'package:openweather/controller.dart';

class HomePage extends StatelessWidget {
  static var city = '';

  HomePage({Key? key}) : super(key: key);

  final WeatherController weatherController =
      Get.put((WeatherController(city: city)));

  final TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            //Tetfield(),
            TextField(
              controller: editingController,
              decoration: const InputDecoration(labelText: 'City'),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: (() {
                  city = editingController.text;
                  controller.update();

                  Get.snackbar('Temprature', '${controller.data.main?.temp}');
                }),
                child: const Text('Search')),
          ],
        );
      }),
    );
  }
}
