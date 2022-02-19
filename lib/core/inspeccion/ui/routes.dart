import 'package:auto_route/auto_route.dart';
import 'package:peritosapp/core/inspeccion/ui/inspeccion_detail_screen.dart';
import 'package:peritosapp/core/inspeccion/ui/inspeccion_screen.dart';

const inspeccionRouter = AutoRoute(path: '/inspeccion/:tipoInspeccionId', page: InspeccionScreen);
const inspeccionDetailRouter = AutoRoute(path: '/inspeccion/:tipoInspeccionId', page: InspeccionDetailScreen);
