import 'package:flutter/material.dart';
import 'package:folkatech/view_model/product_view_model.dart';
import 'package:get/route_manager.dart';

// halaman detail product
class DetailProductView extends StatefulWidget {
  // disini ada parameter yang mana untuk menampung data yang di pilih oleh user
  const DetailProductView({
    super.key,
    required this.name,
    required this.cover,
    required this.desc,
    required this.price,
  });

  final String name;
  final String cover;
  final String desc;
  final int price;

  @override
  State<DetailProductView> createState() => _DetailProductViewState();
}

class _DetailProductViewState extends State<DetailProductView> {
  ProductViewModel productViewModel = ProductViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // untuk meredirect ke halaman sebelumnya
                  Get.back();
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      size: 20.0,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      "back".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  widget.name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 5.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: SizedBox(
                              height: 250,
                              width: double.infinity,
                              child: Image.network(
                                widget.cover,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          // disini saya convert untuk bilangan Rp menggunakan formatCurrency yang sudah saya sediakan di ViewModel
                          "Price : ${productViewModel.formatCurrency(widget.price)}",
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.desc,
                          style: const TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
