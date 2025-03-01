import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/ui/pages/home_page.dart';

final homeHandler = Handler(
  handlerFunc: (context, params) {
    // Esta condición es para corregir el hecho de que, para las rutas
    // /home y / se llama aquí. Es decir, estamos llamando dos veces.
    // Con esta solución solo llamamos una vez.
    final page = params['page']!.first;
    print(page);

    if (page != '/') {
      return HomePage();
    }

    return null;
  },
);
