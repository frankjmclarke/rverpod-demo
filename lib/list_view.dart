import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item_view.dart';
import 'url_provider.dart';

class UrlList extends ConsumerWidget {
  const UrlList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(listStateNotifierProvider);

    return ListView.builder(
      itemBuilder: (context, index) {
        return UrlItem(
          products[index],
        );
      },
      itemCount: products.length,
    );
  }
}
