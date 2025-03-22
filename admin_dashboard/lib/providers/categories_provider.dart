import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/cafe_api.dart';

import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category> categorias = [];

  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResp = CategoriesResponse.fromMap(resp);

    categorias = [...categoriesResp.categorias];
    print(categorias);

    notifyListeners();
  }

  Future newCategory(String name) async {
    // Este es el body necesario para crear la categoría
    final data = {'nombre': name};

    try {
      final json = await CafeApi.post('/categorias', data);
      final newCategory = Category.fromMap(json);

      categorias.add(newCategory);
      notifyListeners();
    } catch (e) {
      print('Error al crear categoría: $e');
    }
  }
}
