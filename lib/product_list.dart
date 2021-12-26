import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'product_item.dart';
import 'products_provider.dart';

class ProductList extends ConsumerWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);

    return ListView.builder(
      itemBuilder: (context, index) {
        return ProductItem(
          products[index],
        );
      },
      itemCount: products.length,
    );
  }
}
