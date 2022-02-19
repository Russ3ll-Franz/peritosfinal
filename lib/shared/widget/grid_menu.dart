import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peritosapp/core/inspeccion/ui/routes.dart';
import 'package:peritosapp/shared/model/grid.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peritosapp/shared/route/app_router.gr.dart';

class GridDashboard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var color = 0xff453658;
    return Flexible(
        child: GridView.builder(
            itemCount: grids.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => MyCard(
                  items: grids[index],
                )));
  }
}

class MyCard extends ConsumerWidget {
  final MyListGrid items;

  const MyCard({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () => context.pushRoute(InspeccionRoute(tipoInspeccionId: items.id)),
        splashColor: Colors.yellow,
        focusColor: Colors.amber,
        highlightColor: Colors.greenAccent,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                items.image,
                scale: 1.8,
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                items.title,
                style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
