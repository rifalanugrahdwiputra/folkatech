import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductViewModel extends GetxController {
  List<Product> data = [];

  @override
  void onInit() async {
    super.onInit();
    fetchData();
  }

  // Mengambil data dari API
  Future<void> fetchData() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/52c41978-6e31-4ea3-b917-01899e3ed373'));

    if (response.statusCode == 200) {
      // ketika response statusnya 200 maka akan dimasukan datanya kedalam model
      final List<dynamic> responseData = json.decode(response.body);
      data = responseData.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  // convert int to Rp(String)
  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    );
    return formatter.format(amount);
  }
}
