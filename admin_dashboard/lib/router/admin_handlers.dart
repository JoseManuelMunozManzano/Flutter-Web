import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';

// No instanciamos.
class AdminHandlers {
  
  static Handler login = Handler(
    handlerFunc: (context, params) {
      return LoginView();
    }
  );
}
