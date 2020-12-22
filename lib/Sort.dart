import 'package:flutter/material.dart';

import 'model.dart';

class Sort extends StatefulWidget {
  @override
  _SortState createState() => _SortState();
}

class _SortState extends State<Sort> {
  bool sort = false;
  List<RecipeItem> list = [
    RecipeItem(title: 'Lasagne', cooklength: 45.0),
    RecipeItem(title: 'Tomtegröt', cooklength: 30.0),
    RecipeItem(title: 'Chili Con carne', cooklength: 60),
    RecipeItem(title: 'Pasta Alfredo', cooklength: 45),
    RecipeItem(title: 'Ugnspannkaka', cooklength: 50),
    RecipeItem(title: 'Franssyska i ugn', cooklength: 120),
    RecipeItem(title: 'Ärtsoppa', cooklength: 30),
    RecipeItem(title: 'Pytt i panna', cooklength: 30),
    RecipeItem(title: 'Chorizogryta', cooklength: 45),
    RecipeItem(title: 'Igelkottsgryta', cooklength: 60),
    RecipeItem(title: 'Rokot krompli', cooklength: 90),
    RecipeItem(title: 'Tikka massala', cooklength: 40),
    RecipeItem(title: 'Pasta Bolognese', cooklength: 25),
    RecipeItem(title: 'Ärtsoppa', cooklength: 30),
    RecipeItem(title: 'Pytt i panna', cooklength: 30),
    RecipeItem(title: 'Chorizogryta', cooklength: 45),
    RecipeItem(title: 'Igelkottsgryta', cooklength: 60),
    RecipeItem(title: 'Rokot krompli', cooklength: 90),
    RecipeItem(title: 'Tikka massala', cooklength: 40),
    RecipeItem(title: 'Pasta Bolognese', cooklength: 25),
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
