import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/providers/sidemenu_provider.dart';

import 'package:admin_dashboard/ui/views/no_page_found_view.dart';

// No instanciamos.
class NoPageFoundHandlers {
  static Handler noPageFound = Handler(
    handlerFunc: (context, params) {
      // Se indica la ruta /404, pero se podría poner cualquier ruta no existente en nuestra app.
      Provider.of<SidemenuProvider>(context!, listen: false).setCurrentPageUrl('/404');

      return NoPageFoundView();
    },
  );
}
