import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'url_model.dart';

class UrlItem extends ConsumerWidget {
  const UrlItem(this.aUrl, {Key? key}) : super(key: key);

  final UrlModel aUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(aUrl.title),
      trailing: IconButton(
        onPressed: () {
          aUrl.toggleFavorite(ref);
        },
        icon: Icon(
          // show an empty or filled favorite icon depending on the product's favorite property
          aUrl.isFavorite ? Icons.favorite : Icons.favorite_border,
        ),
      ),
    );
  }
}
