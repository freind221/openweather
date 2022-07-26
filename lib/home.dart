import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openweather/binding.dart';
import 'package:openweather/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
  static RxString city = ''.obs;
}

class _HomePageState extends State<HomePage> {
  final WeatherController weatherController =
      Get.put((WeatherController(city: HomePage.city)));

  //final TextEditingController editingController = TextEditingController();

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
            //Tetfield(),
            TextField(
              controller: controller.editingController1,
              onChanged: (value) {
                HomePage.city = value.obs;
                controller.updateCity(HomePage.city);
              },
              // onSubmitted: (value) {
              //   HomePage.city = value.obs;
              //   controller.updateCity(HomePage.city);
              // },
              decoration: const InputDecoration(labelText: 'City'),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: (() {
                  print('city${HomePage.city}');
                  //HomePage.city = controller.editingController1.text.obs;
                  //controller.updateCity(HomePage.city);
                  //HomePage.city = controller.editingController1.text.obs;

                  print('Check${HomePage.city}');
                  controller.fetchProducts();
                  print('Check2${HomePage.city}');

                  //print(controller.editingController1.text);

                  //controller.update();

                  Get.snackbar('Temprature', '${controller.data?.main?.temp}');
                }),
                child: const Text('Search')),
          ],
        );
      }),
    );
  }
}
