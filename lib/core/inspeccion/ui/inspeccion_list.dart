import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:peritosapp/core/inspeccion/model/inspeccion/inspeccion.dart';
import 'package:peritosapp/core/inspeccion/provider/inspeccion_provider.dart';
import 'package:peritosapp/core/inspeccion/provider/inspeccion_viewmodel.dart';
import 'package:peritosapp/core/inspeccion/state/inspeccion_state.dart';
import 'package:peritosapp/core/inspeccion/ui/inspeccion_detail_screen.dart';
import 'package:peritosapp/core/inspeccion/ui/inspeccion_tipo_screen.dart';
import 'package:peritosapp/shared/http/http_exceptions.dart';
import 'package:peritosapp/shared/widget/loading_indicators.dart';

class InspeccionView extends ConsumerStatefulWidget {
  final Size mySize;
  final double myCategoryHeight;
  final String idTipoTasacion;

  InspeccionView({Key? key, required this.mySize, required this.myCategoryHeight, required this.idTipoTasacion}) : super(key: key);

  @override
  ConsumerState<InspeccionView> createState() => _InspeccionViewState();
}

class _InspeccionViewState extends ConsumerState<InspeccionView> {
  final InspeccionTipoScroller categoriesScroller = InspeccionTipoScroller();

  ScrollController controller = ScrollController();
  double topContainer = 0;
  bool closeTopContainer = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      double value = controller.offset / 119;
      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(inspeccionProviderFamily3(widget.idTipoTasacion)).when(loading: () {
      return LoadingIndicators.instance.smallLoadingAnimation(context);
    }, data: (data) {
      return Expanded(
        /*  child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width, */
        child: Column(children: <Widget>[
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: closeTopContainer ? 0 : 1,
            child: AnimatedContainer(
                //color: Colors.amber,
                duration: const Duration(milliseconds: 200),
                width: widget.mySize.width,
                alignment: Alignment.topCenter,
                height: closeTopContainer ? 0 : widget.myCategoryHeight,
                child: categoriesScroller),
          ),
          InspeccionList(inspeccionList: data, topContainer: topContainer, myscroller: controller)
        ]),
      );
    }, error: (Object error, StackTrace? stackTrace) {
      return _widgetShimmer(context, ref);
    });

    /*  return state.when(
      initial: () {
        return _widgetShimmer(context, ref);
      },
      loadInProgress: () {
        return LoadingIndicators.instance.smallLoadingAnimation(context);
      },
      inspeccionLoaded: (inspeccion) {
        return Expanded(
            child: Column(
          children: <Widget>[
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: closeTopContainer ? 0 : 1,
              child: AnimatedContainer(
                  //color: Colors.amber,
                  duration: const Duration(milliseconds: 200),
                  width: widget.mySize.width,
                  alignment: Alignment.topCenter,
                  height: closeTopContainer ? 0 : widget.myCategoryHeight,
                  child: categoriesScroller),
            ),
            InspeccionList(inspeccionList: inspeccion, topContainer: topContainer, myscroller: controller)
          ],
        ));
      },
      error: (HttpException error) {
        return _widgetShimmer(context, ref);
      },
    ); */
  }
}

class InspeccionList extends StatelessWidget {
  final List<Inspeccion> inspeccionList;
  final ScrollController myscroller;
  final double topContainer;
  const InspeccionList({Key? key, required this.inspeccionList, required this.topContainer, required this.myscroller}) : super(key: key);

  Color? getColor(String riesgoID) {
    if (riesgoID == "1") {
      return Colors.greenAccent[700];
    } else if (riesgoID == "2") {
      return Colors.yellowAccent[700];
    } else {
      return Colors.redAccent[700];
    }
  }

  Color getColorFont(String riesgoID) {
    if (riesgoID == "1") {
      return Colors.black;
    } else if (riesgoID == "2") {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: myscroller,
        itemCount: inspeccionList.length,
/*         shrinkWrap: true,
 */
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          double scale = 1.0;
          if (topContainer > 0.5) {
            scale = index + 0.5 - topContainer;
            if (scale < 0) {
              scale = 0;
            } else if (scale > 1) {
              scale = 1;
            }
          }
          return Opacity(
            opacity: scale,
            child: Transform(
              transform: Matrix4.identity()..scale(scale, scale),
              alignment: Alignment.bottomCenter,
              child: Align(
                heightFactor: 0.7,
                alignment: Alignment.topCenter,
                child: InkWell(
                  child: Container(
                    height: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(const Radius.circular(20.0)), color: getColor(inspeccionList[index].riesgoId.toString()), boxShadow: [
                      BoxShadow(color: Colors.black.withAlpha(80), blurRadius: 10.0),
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "COORDINACIÓN: " + inspeccionList[index].coordinacionCorrelativo.toString(),
                                  style: TextStyle(fontSize: 16, color: getColorFont(inspeccionList[index].riesgoId.toString()), fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  inspeccionList[index].solicitanteNombre.toString(),
                                  style: TextStyle(fontSize: 15, color: getColorFont(inspeccionList[index].riesgoId.toString())),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Iconsax.calendar, color: getColorFont(inspeccionList[index].riesgoId.toString())),
                                    SizedBox(width: 8),
                                    Text(
                                      inspeccionList[index].inspeccionFecha.toString(),
                                      style: TextStyle(fontSize: 15, color: getColorFont(inspeccionList[index].riesgoId.toString())),
                                      /* overflow: TextOverflow.fade,
                                        maxLines: 2,
                                         softWrap: false, */
                                    ),
                                    SizedBox(width: 16),
                                    Icon(
                                      Iconsax.clock,
                                      color: getColorFont(inspeccionList[index].riesgoId.toString()),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      inspeccionList[index].inspeccionHora.toString(),
                                      style: TextStyle(fontSize: 15, color: getColorFont(inspeccionList[index].riesgoId.toString())),
                                      /*color: Colors.grey para las letras
                                      overflow: TextOverflow.fade,
                                        maxLines: 2,
                                         softWrap: false, */
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => InspeccionDetailScreen()));
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _widgetShimmer(BuildContext context, WidgetRef ref) {
  return Container();
}

class Loading extends StatelessWidget {
  final String loadingMessage;

  const Loading({required Key key, required this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
//              color: Colors.lightGreen,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 24),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
          ),
        ],
      ),
    );
  }
}

class Error extends StatelessWidget {
  final String errorMessage;

  final Function onRetryPressed;

  const Error({required Key key, required this.errorMessage, required this.onRetryPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          RaisedButton(
            color: Colors.redAccent,
            child: Text(
              'Retry',
              style: TextStyle(
//                color: Colors.white,
                  ),
            ),
            onPressed: onRetryPressed(),
          )
        ],
      ),
    );
  }
}
