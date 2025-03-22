import 'package:flutter/material.dart';

class CategoriesDTS extends DataTableSource {
  // Como se construye una fila.
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        // Como en categories_view.dart tenemos 4 columnas, aquí tiene
        // que haber 4 celdas.
        DataCell(Text('Cell #1 index: $index')),
        DataCell(Text('Cell #2 index: $index')),
        DataCell(Text('Cell #3 index: $index')),
        DataCell(Text('Cell #4 index: $index')),
      ]
    );
  }

  // Si no tenemos el número exacto de columnas.
  @override
  bool get isRowCountApproximate => false;

  // El número de elementos que tiene el data table.
  @override
  int get rowCount => 1000;

  @override
  int get selectedRowCount => 0;
}
