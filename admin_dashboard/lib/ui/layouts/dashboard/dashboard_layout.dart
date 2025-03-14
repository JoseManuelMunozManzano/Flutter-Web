import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  // El child que mostraremos en alguna parte del layout.
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Dashboard', style: TextStyle(fontSize: 50)),
          Expanded(child: child)
        ],
      )),
    );
  }
}
