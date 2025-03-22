import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/api/cafe_api.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/providers/sidemenu_provider.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';

import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';

// El main puede ser asíncrono sin problemas.
void main() async {
  // Configuramos LocalStorage antes de hacer cualquier otra cosa en la app.
  // Devuelve un Future, por lo que tenemos que esperar a que se termine la
  // configuración.
  // Con esto, en cualquier parte de la app tengo acceso al LocalStorage.
  await LocalStorage.configurePrefs();
  
  CafeApi.configureDio();

  // Configuramos rutas
  Flurorouter.configureRoutes();
  
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // Cuando la aplicación crea el AuthProvider inmediatamente
          // empiece el proceso de autenticación.
          // Con lazy: true (valor por defecto) espera hasta que se usa
          lazy: false,
          create: (_) => AuthProvider(),
        ),

        ChangeNotifierProvider(lazy: false, create: (_) => SidemenuProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Tener en cuenta que un método build no puede ser async.
  // Esto es porque se tiene que devolver un Widget, no un Future que
  // devuelva un Widget.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      // Para poder cambiar de Layout.
      navigatorKey: NavigationService.navigatorKey,
      // Para poder mostrar los snackbars
      scaffoldMessengerKey: NotificationsService.messengerKey,
      // El child es la vista que necesitamos mostrar.
      // Se devuelve un layout al que se le pasa la view que tiene que mostrar.
      builder: (_, child) {
        // Para este momento ya debemos de saber si tenemos un token o no, o si el token
        // funcionó o no.
        // Si tenemos token no hay que mostrar este AuthLayout, sino mandarlo
        // al Dashboard.
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking) {
          return SplashLayout();
        } else if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      },

      // Configuración personalizada del scrollbar
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStatePropertyAll(Colors.grey[500]),
        ),
      ),
    );
  }
}
