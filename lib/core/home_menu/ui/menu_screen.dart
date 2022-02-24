import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:peritosapp/core/auth/provider/auth_provider.dart';
import 'package:peritosapp/core/home_menu/provider/home_provider.dart';
import 'package:peritosapp/data/model/user/response/user_response.dart';
import 'package:peritosapp/shared/http/http_exceptions.dart';
import 'package:peritosapp/shared/repository/user_view_repository.dart';
import 'package:peritosapp/shared/widget/grid_menu.dart';

import '../../auth/model/user_response/user.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFF5F5F5),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.black),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding:
              EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
          child: Container(
            height: size.height,
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "ALLEMANT PERITOS",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "Menu",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GridDashboard()
            ]),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: UserAccountsDrawerHeader(
                  accountName: Text("userModel."),
                  currentAccountPicture: CircleAvatar(
                    radius: 40.0,
                    backgroundImage:
                        AssetImage('assets/images/person/user.jpg'),
                    backgroundColor: Colors.white,
                  ),
                  accountEmail: null,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_circle,
                ),
                title: Text('Registrados'),
                onTap: () {
                  //ProfileScreen(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configurar'),
                onTap: () {
                  //SettingScreen(context);
                },
              ),
              ListTile(
                leading: Icon(Iconsax.logout),
                title: Text('Logout'),
                onTap: () {
                  ref.read(homeProvider.notifier).logout();
                },
              ),
            ],
          ),
        ),
      ),
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
