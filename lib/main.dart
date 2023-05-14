import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_favorite_demo/url_provider.dart';
import 'package:riverpod_favorite_demo/sharing_list.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure binding is initialized
  SharingList("");
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(listProvider);

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        // Use the AutoDispose extension to watch item.name and trigger a rebuild
        final itemName = ref.watch(listProvider.select((value) => value[index].name));

        return ListTile(
          title: Text(itemName),
          subtitle: Text(item.id.toString()),
          trailing: IconButton(
            icon: Icon(item.isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              ref.read(listStateNotifierProvider.notifier).setFavorite(item.id, !item.isFavorite);
            },
          ),
        );
      },
    );
  }
}


