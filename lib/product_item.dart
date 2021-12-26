import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'product_model.dart';

class ProductItem extends ConsumerWidget {
  const ProductItem(this.product, {Key? key}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(product.title),
      trailing: IconButton(
        onPressed: () {
          product.toggleFavorite(ref);
        },
        icon: Icon(
          // show an empty or filled favorite icon depending on the product's favorite property
          product.isFavorite ? Icons.favorite : Icons.favorite_border,
        ),
      ),
    );
  }
}
