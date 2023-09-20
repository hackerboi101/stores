import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stores/controllers/stores_controller.dart';
import 'package:stores/models/stores_model.dart';

class StoreDetails extends StatelessWidget {
  StoreDetails({Key? key}) : super(key: key);

  final StoresController storesController = Get.find();

  @override
  Widget build(BuildContext context) {
    final selectedStore = storesController.storeDetails.isNotEmpty
        ? storesController.storeDetails[0]
        : Data();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 35, 48, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(27, 35, 48, 1),
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(120, 50, 143, 1),
        ),
        title: Column(
          children: [
            Image.asset(
              'assets/images/app_logo.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(height: 3),
            const Text(
              'Stores',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(120, 50, 143, 1),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Store ID: ${selectedStore.id ?? ''}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(189, 189, 189, 1),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Store Name: ${selectedStore.name ?? ''}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(189, 189, 189, 1),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Store Location: ${selectedStore.address ?? ''}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(189, 189, 189, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
