import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
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
  int _page = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Groceries",style: TextStyle(fontWeight: FontWeight.bold,)),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          StreamBuilder(
            stream: sl<GetGroceriesGroups>().getGroceriesGroups(),
            builder: (context, snapshot) {
              return TextButton(
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
                          TextButton(
                            onPressed: () {
                              _textEditingController.clear();
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () async {
                              if(snapshot.data!.any((element) => element.name == "Custom")){
                                await sl<AddGrocery>().addGrocery(groceries: null,grocery: GroceryItemEntity(id: Isar.autoIncrement, recipeGroupId: 0, name: _textEditingController.text, isChecked: false));
                                _textEditingController.clear();
                                setState(() {});
                                if(context.mounted)Navigator.pop(context);
                              }else{
                                await sl<CreateGroceryGroup>().createGroceryGroup(GroceryRecipeGroupEntity(id: 0, name: "Custom", link: "", isCreatedByUser: true, items: List.empty()));
                                await sl<AddGrocery>().addGrocery(groceries: null,grocery: GroceryItemEntity(id: Isar.autoIncrement, recipeGroupId: 0, name: _textEditingController.text,isChecked: false));
                                _textEditingController.clear();
                                setState(() {});
                                if(context.mounted)Navigator.pop(context);
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                            ),
                            child: Text("Add",style: TextStyle(color: Theme.of(context).colorScheme.primary == Color(0xFFF8F8FF) ? Colors.black : Colors.white)),
                          ),
                        ],
                      )
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.primary == Color(0xFFF8F8FF) || Theme.of(context).colorScheme.primary == Color(0xFF7FFFD4) ? Colors.black : Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text("Add")
                  ],
                )
              );
            }
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: StreamBuilder(
        stream: sl<GetGroceriesGroups>().getGroceriesGroups(),
        builder: (context, snapshot){
          Stream<List<GroceryItemEntity>> groceriesStream = sl<GetGroceries>().getGroceries();
          if(snapshot.hasData){
            List<GroceryRecipeGroupEntity> groceryGroups = snapshot.data!;
            return Column(
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: (){
                        _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                        setState(() {
                          _page = 0;
                        });
                      },
                      child: Text("All",style: TextStyle(color: _page == 0 ? Theme.of(context).colorScheme.primary : Colors.grey),)
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: groceryGroups.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: TextButton(
                                onPressed: () {
                                  _pageController.animateToPage(index+1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                                  setState(() {
                                    _page = index+1;
                                  });
                                },
                                child: SizedBox(
                                  width: groceryGroups[index].isCreatedByUser ? null : 100,
                                  child: Text(
                                    groceryGroups[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: index+1 == _pageController.page?.round() ? Theme.of(context).colorScheme.primary : Colors.grey,
                                    )
                                  ),
                                )
                              )
                            );
                          }
                        )
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _page = index;
                      });
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: StreamBuilder(
                          stream: groceriesStream,
                          builder: (context,groceriesSnapshot){
                          if(groceriesSnapshot.hasData){
                            List<GroceryItemEntity> groceries = groceriesSnapshot.data!;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Text("All Groceries",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18))),
                                    PopupMenuButton(
                                      itemBuilder: (context)=>[
                                        /*PopupMenuItem(
                                          onTap: (){},
                                          child: Text("Reverse order")
                                        ),*/
                                        PopupMenuItem(
                                          onTap: (){
                                            sl<DeleteGrocery>().deleteGroceryItem( id: null , ids: groceries.where((element) => element.isChecked).map((e) => e.id).toList());
                                          },
                                          child: Text("Clear done groceries")
                                        ),
                                        PopupMenuItem(
                                          onTap: (){
                                            showDialog(
                                                context: context,
                                                builder: (context) => AlertDialog(
                                                  title: Text("Delete Groceries"),
                                                  content: Text("Are you sure you want to delete these groceries?"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Cancel"),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        sl<DeleteGrocery>().deleteGroceryItem( id: null , ids: groceries.map((e) => e.id).toList());
                                                        Navigator.pop(context);
                                                      },
                                                      style: TextButton.styleFrom(
                                                        backgroundColor: Theme.of(context).colorScheme.error,
                                                      ),
                                                      child: Text("Delete",style: TextStyle(color: Theme.of(context).colorScheme.onTertiary)),
                                                    )
                                                  ]
                                                )
                                            );
                                          },
                                          child: Text("Clear all groceries")
                                        ),
                                      ],
                                    )  ,
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                                  child: Divider(),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: groceries.length,
                                    itemBuilder: (context, index) {
                                      return CheckboxListTile(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        value: groceries[index].isChecked,
                                        title: Text(groceries[index].name,style: TextStyle(decoration: groceries[index].isChecked ? TextDecoration.lineThrough : null)),
                                        onChanged: (value) async{
                                          await sl<ToggleGrocery>().toggleGroceryItem(groceries[index].id);
                                        }
                                      );
                                    }
                                  ),
                                ),
                              ],
                            );
                          }
                          return Center(child: Text("No Groceries"));
                          }
                        ),
                      ),
                      ...groceryGroups.map((grocery) =>
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Text(grocery.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18))),
                                  PopupMenuButton(
                                    itemBuilder: (context)=>[
                                      PopupMenuItem(
                                        onTap: () async{
                                          await sl<DeleteGrocery>().deleteGroceryItem( id: null , ids: grocery.items.where((element) => element.isChecked).map((e) => e.id).toList());
                                          setState(() {});
                                        },
                                        child: Text("Clear done groceries")
                                      ),
                                      PopupMenuItem(
                                        onTap: (){
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                  title: Text("Delete Group"),
                                                  content: Text("Are you sure you want to delete this group?"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Cancel"),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        sl<DeleteGroceryGroup>().deleteGroceryGroup(grocery.id);
                                                        Navigator.pop(context);
                                                      },
                                                      style: TextButton.styleFrom(
                                                        backgroundColor: Theme.of(context).colorScheme.error,
                                                      ),
                                                      child: Text("Delete",style: TextStyle(color: Theme.of(context).colorScheme.onTertiary)),
                                                    )
                                                  ]
                                              )
                                          );
                                        },
                                        child: Text("Delete group")
                                      ),
                                    ]
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                                child: Divider(),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: grocery.items.length,
                                  itemBuilder: (context, index) {
                                    return CheckboxListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      value: grocery.items[index].isChecked,
                                      title: Text(grocery.items[index].name,style: TextStyle(decoration: grocery.items[index].isChecked ? TextDecoration.lineThrough : null)),
                                      onChanged: (value) async{
                                        await sl<ToggleGrocery>().toggleGroceryItem(grocery.items[index].id);
                                        setState(() {});
                                      }
                                    );
                                  }
                                )
                              )
                            ],
                          ),
                        )
                      )
                    ]
                  ),
                ),
              ],
            );

          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

/*Widget completedGroceriesTile({
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
}*/
