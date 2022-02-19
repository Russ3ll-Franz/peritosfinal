import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class InspeccionDetailScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String assetName = 'assets/icon/svg/arrow-left-from-line.svg';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            assetName,
            
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "HOJA DE COORDINACIÓN",
          style: TextStyle(fontFamily: 'Nunito', fontSize: 18, color: Color(0xFF545D68), fontWeight: FontWeight.bold),
        ),
      ),
      /*    body: RefreshIndicator(
        onRefresh: () => _inspeccionDetailBloc.fetchInspeccionDetail(widget.coordinacionID),
        child: StreamBuilder<ApiResponse<Inspeccion>>(
          stream: _inspeccionDetailBloc.inspeccionDetailStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return Loading(loadingMessage: snapshot.data.message);
                  break;
                case Status.COMPLETED:
                  return ShowInspeccionDetail(displayInspeccion: snapshot.data.data);
                  break;
                case Status.ERROR:
                  return Error(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _inspeccionDetailBloc.fetchInspeccionDetail(widget.coordinacionID),
                  );
                  break;
              }
            }
            return Container();
          },
        ),
      ), */
    );
  }
}

/* class ShowInspeccionDetail extends StatelessWidget {
/*   final Inspeccion displayInspeccion;

  ShowInspeccionDetail({Key key, this.displayInspeccion}) : super(key: key);

  Widget changeColorRiesgo(tipo) {
    switch (tipo) {
      case 'BAJO':
        return Container(
          height: 30,
          width: 60,
          //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)), color: Colors.green, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(80), blurRadius: 10.0),
          ]),
          child: Center(
            child: Text(displayInspeccion.riesgoNombre,
                textAlign: TextAlign.center,
                style: TextStyle(
                    //backgroundColor: Colors.green,
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        );
        break;
      case 'MEDIO':
        return Container(
          height: 30,
          width: 60,
          //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)), color: Colors.yellow, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(80), blurRadius: 10.0),
          ]),
          child: Center(
            child: Text(displayInspeccion.riesgoNombre,
                textAlign: TextAlign.center,
                style: TextStyle(
                    //backgroundColor: Colors.green,
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        );
        break;
      case 'ALTO':
        return Container(
          height: 30,
          width: 60,
          //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)), color: Colors.red, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(80), blurRadius: 10.0),
          ]),
          child: Center(
            child: Text(displayInspeccion.riesgoNombre,
                textAlign: TextAlign.center,
                style: TextStyle(
                    //backgroundColor: Colors.green,
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        );

        break;
      default:
    }
  }
 */
 /*  @override
  Widget build(BuildContext context) {
    final String assetName = 'assets/icon/svg/arrow-left-from-line.svg';
    return new Scaffold(
      body: Stack(children: [
        ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //InspeccionDetailMapa(),
            //showMap(),

            InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
                  BoxShadow(color: Colors.black.withAlpha(80), blurRadius: 10.0),
                ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(onPressed: () {}, icon: SvgPicture.asset("")),
                          SizedBox(
                            width: 8,
                          ),
                          Text("COORDINADOR", style: TextStyle(fontFamily: 'Nunito', fontSize: 14, color: Color.fromRGBO(233, 115, 44, 1), fontWeight: FontWeight.w900)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(displayInspeccion.coordinadorNombre.toUpperCase(), style: TextStyle(fontFamily: 'Nunito', fontSize: 16, color: Color(0xFF545D68), fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(Iconsax.newspaper_o),
                          SizedBox(
                            width: 8,
                          ),
                          Text("COORDINACIÓN", style: TextStyle(fontFamily: 'Nunito', fontSize: 14, color: Color.fromRGBO(233, 115, 44, 1), fontWeight: FontWeight.w900)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(displayInspeccion.coordinacionCorrelativo, style: TextStyle(fontFamily: 'Nunito', fontSize: 16, color: Color(0xFF545D68), fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(Iconsax.exclamation_circle),
                          SizedBox(
                            width: 8,
                          ),
                          Text("RIESGO", style: TextStyle(fontFamily: 'Nunito', fontSize: 14, color: Color.fromRGBO(233, 115, 44, 1), fontWeight: FontWeight.w900)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      changeColorRiesgo(displayInspeccion.riesgoNombre),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(Iconsax.calendar),
                          SizedBox(
                            width: 8,
                          ),
                          Text("FECHA DE SOLICITUD", style: TextStyle(fontFamily: 'Nunito', fontSize: 14, color: Color.fromRGBO(233, 115, 44, 1), fontWeight: FontWeight.w900)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(displayInspeccion.fechaSolicitud, style: TextStyle(fontFamily: 'Nunito', fontSize: 16, color: Color(0xFF545D68), fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(Iconsax.calendar),
                          SizedBox(
                            width: 8,
                          ),
                          Text("FECHA DE ENTREGA", style: TextStyle(fontFamily: 'Nunito', fontSize: 14, color: Color.fromRGBO(233, 115, 44, 1), fontWeight: FontWeight.w900)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(displayInspeccion.fechaEntrega, style: TextStyle(fontFamily: 'Nunito', fontSize: 16, color: Color(0xFF545D68), fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Iconsax.black_tie),
                          SizedBox(
                            width: 10,
                          ),
                          Text("SOLICITANTE", style: TextStyle(fontFamily: 'Nunito', fontSize: 14, color: Color.fromRGBO(233, 115, 44, 1), fontWeight: FontWeight.w900)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(displayInspeccion.solicitanteNombre, style: TextStyle(fontFamily: 'Nunito', fontSize: 16, color: Color(0xFF545D68), fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Iconsax.user),
                          SizedBox(
                            width: 10,
                          ),
                          Text("CLIENTE", style: TextStyle(fontFamily: 'Nunito', fontSize: 14, color: Color.fromRGBO(233, 115, 44, 1), fontWeight: FontWeight.w900)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(displayInspeccion.clienteNombre, style: TextStyle(fontFamily: 'Nunito', fontSize: 16, color: Color(0xFF545D68), fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Iconsax.home),
                          SizedBox(
                            width: 10,
                          ),
                          Text("TIPO DE INSPECCIÓN", style: TextStyle(fontFamily: 'Nunito', fontSize: 14, color: Color.fromRGBO(233, 115, 44, 1), fontWeight: FontWeight.w900)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(displayInspeccion.tipoInspeccionNombre.toUpperCase(), style: TextStyle(fontFamily: 'Nunito', fontSize: 16, color: Color(0xFF545D68), fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Iconsax5.user_circle),
                          SizedBox(
                            width: 10,
                          ),
                          Text("PERITO", style: TextStyle(fontFamily: 'Nunito', fontSize: 14, color: Color.fromRGBO(233, 115, 44, 1), fontWeight: FontWeight.w900)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(displayInspeccion.peritoNombre.toUpperCase(), style: TextStyle(fontFamily: 'Nunito', fontSize: 16, color: Color(0xFF545D68), fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icon),
                          SizedBox(
                            width: 10,
                          ),
                          Text("CONTACTO", style: TextStyle(fontFamily: 'Nunito', fontSize: 14, color: Color.fromRGBO(233, 115, 44, 1), fontWeight: FontWeight.w900)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(displayInspeccion.inspeccionContacto.toUpperCase(), style: TextStyle(fontFamily: 'Nunito', fontSize: 16, color: Color(0xFF545D68), fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Iconsax.road),
                          SizedBox(
                            width: 10,
                          ),
                          Text("DIRECCIÓN", style: TextStyle(fontFamily: 'Nunito', fontSize: 14, color: Color.fromRGBO(233, 115, 44, 1), fontWeight: FontWeight.w900)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(displayInspeccion.inspeccionDireccion.toUpperCase(), style: TextStyle(fontFamily: 'Nunito', fontSize: 16, color: Color(0xFF545D68), fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Iconsax.window_maximize),
                          SizedBox(
                            width: 10,
                          ),
                          Text("SERVICIOS", style: TextStyle(fontFamily: 'Nunito', fontSize: 14, color: Color.fromRGBO(233, 115, 44, 1), fontWeight: FontWeight.w900)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(displayInspeccion.servicioTipoNombre.toUpperCase(), style: TextStyle(fontFamily: 'Nunito', fontSize: 16, color: Color(0xFF545D68), fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Iconsax.edit),
                          SizedBox(
                            width: 10,
                          ),
                          Text("OBSERVACIONES", style: TextStyle(fontFamily: 'Nunito', fontSize: 14, color: Color.fromRGBO(233, 115, 44, 1), fontWeight: FontWeight.w900)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(displayInspeccion.inspeccionObservacion.toUpperCase(), style: TextStyle(fontFamily: 'Nunito', fontSize: 16, color: Color(0xFF545D68), fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 14,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                        Container(
                          height: 42.0,
                          child: RaisedButton(
                            onPressed: () {
                              /*      Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RegisterInspeccion(
                                          inspeccionID:
                                              displayInspeccion.inspeccionId))); */
                            },
                            child: Ink(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.0), gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color.fromRGBO(255, 125, 0, 1), Color.fromRGBO(255, 0, 0, 1)])),
                              child: Container(
                                  constraints: BoxConstraints(maxWidth: 160, minHeight: 55),
                                  //alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Iconsax.home, color: Colors.white),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Registrar",
                                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )),
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                            padding: EdgeInsets.all(0.0),
                          ),
                        ),
                        SizedBox(
                          width: 10.00,
                        ),
                        Container(
                          height: 42.0,
                          child: RaisedButton(
                            onPressed: () {
                              /* Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => InspeccionMapa(
                                          latitud: double.parse(
                                              displayInspeccion
                                                  .inspeccionLatitud),
                                          longitud: double.parse(
                                              displayInspeccion
                                                  .inspeccionLongitud)))); */
                            },
                            child: Ink(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color.fromRGBO(255, 125, 0, 1), Color.fromRGBO(255, 0, 0, 1)])),
                              child: Container(
                                  constraints: BoxConstraints(maxWidth: 160, minHeight: 55),
                                  //alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Iconsax.map, color: Colors.white),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "UBICACIÓN",
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )),
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                            padding: EdgeInsets.all(0.0),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
 */}
 */