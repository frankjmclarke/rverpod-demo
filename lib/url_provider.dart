import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_favorite_demo/sharing_list.dart';
import 'url_model.dart';

/*
listProvider: This is a Provider that provides the shared list of
UrlModel items from the SharingList class. The SharingList.items is accessed
to get the initial value for the state.
 */
final listProvider = Provider<List<UrlModel>>((ref) {
  // Access the shared list of items from the `SharingList` class
  return SharingList.items;
});

/*
listStateNotifierProvider: This is a StateNotifierProvider that creates an instance of
UrlListState and initializes it with the value obtained from
sharingListProvider using ref.watch(sharingListProvider). This ensures that any
changes to SharingList.items will trigger a state change in UrlListState
automatically, eliminating the need to manually update the state using
state = newState.
 */
final listStateNotifierProvider = StateNotifierProvider<ListStateNotifier, List<UrlModel>>(
      (ref) {
    // Initialize `ProductListState` with the value of `sharingListItemsProvider`
    return ListStateNotifier(ref.watch(listProvider));
  },
);
/*
ListStateNotifier: This is a StateNotifier that extends List<UrlModel>. It
represents the state of the list of UrlModel items and provides methods to
modify the state. The constructor of UrlListState takes a list of
UrlModel items as an argument, which is obtained from sharingListProvider
during initialization. The setFavorite method is an example of how state
modifications can be done in Riverpod. It updates the isFavorite property of a
ProductModel item with the provided id and isFavorite value, and then updates
the state using state = newState, triggering a state change.
 */
class ListStateNotifier extends StateNotifier<List<UrlModel>> {
  ListStateNotifier(List<UrlModel> items) : super(items);
 /* ProductListState()
      : super(
          // on initialization, we set the state to a random list of products
            SharingList.items
        );*/

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
