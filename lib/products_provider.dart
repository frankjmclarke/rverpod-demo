import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'product_model.dart';

final productsProvider =
    StateNotifierProvider<ProductListState, List<ProductModel>>(
  (ref) {
    return ProductListState();
  },
);

class ProductListState extends StateNotifier<List<ProductModel>> {
  ProductListState()
      : super(
          // on initialization, we set the state to a random list of products
          List.generate(
            10,
            (index) {
              return ProductModel.random();
            },
          ),
        );

  void setFavorite(int id, bool isFavorite) {
    var newState = state.map(
      (p) {
        // if p is the intended product,
        // update its isFavorite value
        if (p.id == id) {
          return p.copyWith(isFavorite: isFavorite);
        } else {
          return p;
        }
      },
    ).toList();

    // we cant just do state[index].isFavorite = isFavorite,
    // bcz that would not trigger the state change,
    // so we have to do somethings like state = ...
    state = newState;
  }
}
