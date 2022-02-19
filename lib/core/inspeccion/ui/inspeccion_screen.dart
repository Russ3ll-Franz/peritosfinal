import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:peritosapp/core/inspeccion/ui/inspeccion_list.dart';
import 'package:peritosapp/core/inspeccion/ui/inspeccion_tipo_screen.dart';

class InspeccionScreen extends ConsumerWidget {
  final String tipoInspeccionId;

  InspeccionScreen({Key? key, @PathParam() required this.tipoInspeccionId}) : super(key: key);

  final InspeccionTipoScroller categoriesScroller = const InspeccionTipoScroller();

  ScrollController controller = ScrollController();
  double topContainer = 0;
  bool closeTopContainer = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.25;
    return SafeArea(
        child: Scaffold(
      appBar: buildAppBar(context),
      body: Container(
          child: Column(
        children: [InspeccionView(mySize: size, myCategoryHeight: categoryHeight, idTipoTasacion: tipoInspeccionId)],
      )),
    ));
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    leading: IconButton(
      icon: Icon(Iconsax.arrow_left, color: Color(0xFF545D68)),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Text(
      "LISTA DE COORDINACIÓN",
      style: TextStyle(fontFamily: 'Nunito', fontSize: 18, color: Color(0xFF545D68), fontWeight: FontWeight.bold),
    ),
  );
}
