import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peritosapp/core/home_menu/provider/home_provider.dart';
import 'package:peritosapp/shared/http/http_exceptions.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("MENU"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.adjust),
            onPressed: () {
              ref.read(homeProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: null,
    );
  }

  Widget _widgetShimmer(BuildContext context, WidgetRef ref) {
    return Container();
  }

  Widget _widgetContent(BuildContext context, WidgetRef ref) {
    return Container() /* final state = ref.watch() */;

    /* return state.when(
      loading: () {
        return _widgetShimmer(context, ref);
      },
      booksLoaded: (books) {
        return ListView.builder(
            itemCount: books.length,
            itemBuilder: (BuildContext context, int index) {
              return RowBookWidget(book: books[index]);
            });
      },
      error: (HttpException error) {
        return _widgetShimmer(context, ref);
      },
    ); */
  }
}
