import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/category.dart';

class CategoriesDTS extends DataTableSource {
  final List<Category> categorias;

  CategoriesDTS(this.categorias);

  // Como se construye una fila.
  @override
  DataRow getRow(int index) {

    final categoria = categorias[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        // Como en categories_view.dart tenemos 4 columnas, aquí tiene
        // que haber 4 celdas.
        DataCell(Text(categoria.id)),
        DataCell(Text(categoria.nombre)),
        DataCell(Text(categoria.usuario.nombre)),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: () {
                print('editando: $categoria');
              },
              icon: Icon(Icons.edit_outlined),
            ),
            IconButton(
              onPressed: () {
                print('borrando: $categoria');
              },
              icon: Icon(Icons.delete_outlined, color: Colors.red.withValues(alpha: 0.8)),
            ),
          ],
        )),
      ],
    );
  }

  // Si no tenemos el número exacto de columnas.
  @override
  bool get isRowCountApproximate => false;

  // El número de elementos que tiene el data table.
  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;
}
