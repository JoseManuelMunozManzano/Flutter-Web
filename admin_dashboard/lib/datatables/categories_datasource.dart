import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/categories_provider.dart';

import 'package:admin_dashboard/models/category.dart';

import 'package:admin_dashboard/ui/modals/category_modal.dart';

class CategoriesDTS extends DataTableSource {
  final List<Category> categorias;
  // Un AlertDiagog requiere el context.
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);

  // Como se construye una fila.
  @override
  DataRow getRow(int index) {
    final categoria = categorias[index];

    final categoryProvider = Provider.of<CategoriesProvider>(
      context,
      listen: false,
    );

    return DataRow.byIndex(
      index: index,
      cells: [
        // Como en categories_view.dart tenemos 4 columnas, aquí tiene
        // que haber 4 celdas.
        DataCell(Text(categoria.id)),
        DataCell(Text(categoria.nombre)),
        DataCell(Text(categoria.usuario.nombre)),
        DataCell(
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    constraints: BoxConstraints(maxWidth: double.infinity),
                    builder: (_) => CategoryModal(categoria: categoria),
                  );
                },
                icon: Icon(Icons.edit_outlined),
              ),
              IconButton(
                onPressed: () {
                  final dialog = AlertDialog(
                    title: Text('¿Está seguro de borrarlo?'),
                    content: Text('¿Borrar definitivamente ${categoria.nombre}?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No')
                      ),
                      TextButton(
                        onPressed: () async {
                          await categoryProvider.deleteCategory(categoria.id);
                          Navigator.of(context).pop();
                        },
                        child: Text('Si, borrar')
                      ),
                    ],
                  );
                  // El builder es una función que se va a llamar para crear este dialog
                  showDialog(
                    context: context,
                    builder: (_) => dialog,
                  );
                },
                icon: Icon(
                  Icons.delete_outlined,
                  color: Colors.red.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),
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
