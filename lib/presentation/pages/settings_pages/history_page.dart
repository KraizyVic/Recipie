import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipie/domain/entities/settings_page_entities.dart';
import 'package:recipie/presentation/state_management/settings_page_cubit.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final PageController _pageController = PageController();
  int _selectedPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(Icons.chevron_left,size: 30,color: Theme.of(context).colorScheme.primary,)
        ),
        actions: [
          IconButton(
            onPressed: (){
              if(_selectedPageIndex == 0){
                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text('Clear Search History'),
                      content: Text('Are you sure you want to clear your search history?'),
                      actions: [
                        TextButton(
                          onPressed: ()=>Navigator.pop(context),
                          child: Text('Cancel')
                        ),
                        TextButton(
                          onPressed: (){
                            context.read<SearchHistoryCubit>().clearSearchHistory();
                            Navigator.pop(context);
                            },
                          child: Text('Clear')
                        ),
                      ]
                    );
                  }
                );
              }else{}
            },
            icon: Icon(Icons.delete_forever),
            color: Theme.of(context).colorScheme.primary,
            iconSize: 30,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                MaterialButton(
                  onPressed: (){
                    _pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                  },
                  color: _selectedPageIndex == 0 ? Theme.of(context).colorScheme.primary.withAlpha(100) : null,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                  elevation: 0,
                  padding: .symmetric(horizontal: 5),
                  child: Text('Search History'),
                ),
                SizedBox(width: 10,),
                MaterialButton(
                  onPressed: (){
                    _pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                  },
                  color: _selectedPageIndex == 1 ? Theme.of(context).colorScheme.primary.withAlpha(100) : null,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                  elevation: 0,
                  padding: .symmetric(horizontal: 5),
                  child: Text('Cook History'),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index){
                setState(() {
                  _selectedPageIndex = index;
                });
              },
              children: [
                BlocBuilder<SearchHistoryCubit,List<SearchHistoryEntity>>(
                  builder: (context,state){
                    if(state.isEmpty){
                      return Center(child: Text("Search History Appears Here"),);
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: state.length,
                        itemBuilder: (context,index){
                          return ListTile(
                            title: Text(state[index].query),
                            shape: RoundedRectangleBorder(borderRadius: .circular(15)) ,
                            trailing: IconButton(
                              onPressed: (){
                                context.read<SearchHistoryCubit>().deleteHistory(state[index].id);
                              },
                              icon: Icon(Icons.remove)
                            ),
                            onTap: (){},
                          );
                        },
                      ),
                    );
                  }
                ),
                Center(child: Text('Cook History'),),
              ],
            ),
          )
        ]
      ),
    );
  }
}
