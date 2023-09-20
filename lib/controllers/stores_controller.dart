// ignore_for_file: prefer_const_declarations, unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:stores/models/stores_model.dart';

class StoresController extends GetxController {
  RxList<Data> stores = <Data>[].obs;
  RxInt selectedStoreId = RxInt(-1);
  RxList<Data> storeDetails = <Data>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStoreData();
  }

  Future<void> fetchStoreData() async {
    final apiUrl = 'http://128.199.215.102:4040/api/stores';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> storesData = data['data'];

        stores.assignAll(
          storesData.map((store) => Data.fromJson(store)).toList(),
        );
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        'Error fetching the data',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void selectStore(int storeId) {
    selectedStoreId.value = storeId;

    final selectedStore = stores.firstWhere(
      (store) => store.id == storeId,
      orElse: () => Data(),
    );

    if (selectedStore != null) {
      storeDetails.assignAll([selectedStore]);
    } else {
      storeDetails.clear();
    }
  }
}
