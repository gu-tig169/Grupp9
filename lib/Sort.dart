import 'package:flutter/material.dart';
import 'package:projectapp/model.dart';

import 'model.dart';

class Sort extends StatefulWidget {
  @override
  _SortState createState() => _SortState();
}

class _SortState extends State<Sort> {
  bool sort = false;
  List<RecipeItem> list = [
    RecipeItem(title: 'Lasagne', ingredients: 'test', cooklength: 40),
    RecipeItem(title: 'Tomtegröt', ingredients: 'test', cooklength: 30),
    RecipeItem(title: 'Chili Con carne', ingredients: 'test', cooklength: 60),
    RecipeItem(title: 'Pasta Alfredo', ingredients: 'test', cooklength: 45),
    RecipeItem(title: 'Ugnspannkaka', ingredients: 'test', cooklength: 50),
    RecipeItem(title: 'Franssyska i ugn', ingredients: 'test', cooklength: 120),
    RecipeItem(title: 'Ärtsoppa', ingredients: 'test', cooklength: 30),
    RecipeItem(title: 'Pytt i panna', ingredients: 'test', cooklength: 10),
    RecipeItem(title: 'Chorizogryta', ingredients: 'test', cooklength: 45),
    RecipeItem(title: 'Igelkottsgryta', ingredients: 'test', cooklength: 45),
    RecipeItem(title: 'Rokot krompli', ingredients: 'test', cooklength: 50),
    RecipeItem(title: 'Tikka massala', ingredients: 'test', cooklength: 60),
    RecipeItem(title: 'Pasta Bolognese', ingredients: 'test', cooklength: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DataTable(sortColumnIndex: 1, sortAscending: sort, columns: [
              DataColumn(
                label: Text('Recipe'),
              ),
              DataColumn(
                numeric: true,
                onSort: (index, ascending) {
                  var sortedItems = list;
                  sortedItems
                      .sort((a, b) => a.cooklength.compareTo(b.cooklength));

                  list =
                      ascending ? sortedItems : sortedItems.reversed.toList();
                  setState(() {
                    sort = ascending;
                  });
                },
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('time'),
                      ],
                    ),
                  ),
                ),
              ),
            ], rows: [
              ...list.map(
                (element) => DataRow(
                  cells: [
                    DataCell(
                      Text(element.title),
                    ),
                    DataCell(
                      Text(element.cooklength.toString()),
                    ),
                  ],
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
