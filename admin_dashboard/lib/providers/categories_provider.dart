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
      // print('Error al crear categoría: $e');
      throw 'Error al crear categoría';
    }
  }

  Future updateCategory(String id, String name) async {
    // Este es el body necesario para crear la categoría
    final data = {'nombre': name};

    try {
      await CafeApi.put('/categorias/$id', data);

      final index = categorias.indexWhere((cat) => cat.id == id);
      if (index != -1) {
        categorias[index].nombre = name;
      }

      notifyListeners();
    } catch (e) {
      // print('Error al actualizar categoría: $e');
      throw 'Error al actualizar categoría';
    }
  }

  Future deleteCategory(String id) async {
    try {
      await CafeApi.delete('/categorias/$id', {});

      categorias.removeWhere((categoria) => categoria.id == id);

      notifyListeners();
    } catch (e) {
      print('Error al eliminar categoría: $e');
    }
  }
}
