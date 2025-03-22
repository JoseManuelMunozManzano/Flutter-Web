import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List categorias = [];

  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    print(resp);

    notifyListeners();
  }
}
