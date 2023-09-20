import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stores/controllers/stores_controller.dart';
import 'package:stores/models/stores_model.dart';
import 'package:stores/views/store_details_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final StoresController storesController = Get.put(StoresController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 35, 48, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(27, 35, 48, 1),
        automaticallyImplyLeading: false,
        centerTitle: true,
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
            const Text(
              'Stores',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(189, 189, 189, 1),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () {
                final storeWidgets = storesController.stores
                    .map((store) => buildStoresContainer(context, store))
                    .toList();
                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: storeWidgets,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStoresContainer(BuildContext context, Data stores) {
    return GestureDetector(
      onTap: () {
        storesController.selectStore(stores.id!);
        Get.to(StoreDetails());
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 40) / 2 - 5,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(120, 50, 143, 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            stores.name ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
