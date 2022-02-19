/*

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peritosapp/core/inspeccion/model/inspeccion/inspeccion.dart';

final messagesFamily = FutureProvider.autoDispose.family<Inspeccion, String>((ref, id) async {

});

class InspeccionProvider extends ChangeNotifier{

} */

/* final userProvider = FutureProvider.autoDispose.family<User, int>((ref, userId) async {
  return fetchUser(userId);
});
 */

/* final cityProvider = Provider((ref) => 'London');
Ahora podemos crear otro provider que consumirá nuestro cityProvider:

final weatherProvider = FutureProvider((ref) async {
  // Usamos `ref.watch` para escuchar a otro provider, y le pasamos el provider
  // que queremos consumir.
  // Aquí: cityProvider
  final city = ref.watch(cityProvider);

  // Entonces podemos usar el resultado para hacer algo basado en el valor de `cityProvider`.
  return fetchWeather(city: city);
}); */