import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:recipie/data/models/grocery_model.dart';
import 'package:recipie/domain/entities/grocery_entity.dart';

import '../../core/dependency_injector.dart';
import '../../domain/use_cases/grocery_use_cases.dart';

class GroceriesPage extends StatefulWidget {
  const GroceriesPage({super.key});

  @override
  State<GroceriesPage> createState() => _GroceriesPageState();
}

class _GroceriesPageState extends State<GroceriesPage> {

  final PageController _pageController = PageController();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Groceries",style: TextStyle(fontWeight: FontWeight.bold,)),
        elevation: 0,
        scrolledUnderElevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Add Grocery"),
                    content: TextField(
                        autofocus: true,
                        controller: _textEditingController,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          hintText: "Enter Grocery",
                        ),
                        onChanged: (val) {}
                    ),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          _textEditingController.clear();
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                      MaterialButton(
                        onPressed: () {
                          sl<AddGrocery>().addGrocery(
                              GroceryItemModel(id: Isar.autoIncrement, name: _textEditingController.text, isChecked: false).toEntity(),
                              null
                          );
                          _textEditingController.clear();
                          Navigator.pop(context);
                        },
                        child: Text("Add"),
                      ),
                    ],
                  )
              );
            },
            child: Row(
              children: [
                Icon(Icons.add),
                Text("Add")
              ],
            )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              StreamBuilder(
                stream: sl<GetGroceries>().getGroceries(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    List<GroceryItemEntity> groceries = snapshot.data!;
                    return Column(
                      children: [
                        Column(
                          children: groceries.where((grocery)=>!grocery.isChecked).map((grocery)=>CheckboxListTile(
                              value: grocery.isChecked,
                              title: Text(grocery.name),
                              onChanged: (value)=>sl<ToggleGrocery>().toggleGrocery(grocery.id!),
                            )
                          ).toList(),
                        ),
                        ?groceries.where((grocery)=>grocery.isChecked).isNotEmpty? completedGroceriesTile(context: context, doneGroceries: groceries.where((grocery)=>grocery.isChecked).toList()) : null
                      ],
                    );
                  }else if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()));
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget completedGroceriesTile({
  required BuildContext context,
  required List<GroceryItemEntity> doneGroceries,
}){
  return Card(
    color: Theme.of(context).colorScheme.tertiary.withAlpha(50),
    elevation: 0,
    child: Column(
      children: [
        ListTile(
          title: Text("Completed Groceries",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
          trailing: IconButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Delete Groceries"),
                      content: Text("Are you sure you want to delete these groceries?"),
                      actions: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),
                        MaterialButton(
                          onPressed: () {
                            sl<DeleteGrocery>().deleteGrocery(null, doneGroceries.map((grocery)=>grocery.id).toList());
                            Navigator.pop(context);
                          },
                          child: Text("Delete"),
                        ),
                      ],
                    )
                );
              },
              icon: Icon(Icons.delete_forever)
          ),
        ),
        Column(
          children: doneGroceries.map((grocery)=>CheckboxListTile(
              value: grocery.isChecked,
              title: Text(grocery.name),
              onChanged: (value)=>sl<ToggleGrocery>().toggleGrocery(grocery.id),
            )
          ).toList(),
        )
      ]
    )
  );
}
