import 'package:fakestoreapiproducts/app/data/models/product/product.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Obx(() => Column(
                children: [
                  ElevatedButton(
                      onPressed: () => controller.getProducts(),
                      child: const Text('Update')),
                  Center(
                    child: controller.products.when(
                        loading: () => const CircularProgressIndicator(),
                        success: (List<Product> list) =>
                            ListView.builder(
                              itemCount: list.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                var item = list[index];
                                return Card(
                                  child: ListTile(
                                    title: Text('${item.id}, ${item.title}'),
                                    subtitle: Text(item.description),
                                    trailing: Text('\$${item.price}'),
                                    leading: Image.network(item.image),
                                  ),
                                );
                              }),
                        failed: (message, error) => Text(
                          message,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),),
                  )
                ],
              )),
        ));
  }
}
