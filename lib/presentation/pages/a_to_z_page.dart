import 'package:flutter/material.dart';
import 'package:recipa/domain/entities/a_to_z_entity.dart';

import '../../core/locator.dart';
import '../../data/data_source/online/a_to_z_online_data_source.dart';
import '../../data/repositories/a_to_z_repository_impl.dart';
import '../../domain/use_cases/a_to_z_use_cases.dart';
import 'a_to_z_item_page.dart';

class AToZPage extends StatefulWidget {
  const AToZPage({super.key});

  @override
  State<AToZPage> createState() => _AToZPageState();
}

class _AToZPageState extends State<AToZPage> {

  late Future<AToZEntity> _aToZ;

  @override
  void initState() {
    super.initState();
    _aToZ = sl<FetchAToZUseCase>().call();
  }

  Future<void> _refreshData() async {
    // For manual refresh
    setState(() {
      _aToZ = FetchAToZUseCase(aToZRepository: AToZRepositoryImpl(aToZOnlineDataSource: AToZOnlineDataSource())).call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A-Z"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          IconButton(onPressed: _refreshData, icon: Icon(Icons.refresh))
        ]
      ),
      body: FutureBuilder(
        future: _aToZ,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          final data = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: data.groups.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  expansionAnimationStyle: AnimationStyle(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.decelerate,
                    //reverseCurve: Curves.bounceOut,
                    //reverseDuration: Duration(milliseconds: 1000)
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                  collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                  backgroundColor: Theme.of(context).colorScheme.tertiary.withAlpha(20),
                  //collapsedBackgroundColor: Theme.of(context).colorScheme.tertiary.withAlpha(100),
                  title: Text(data.groups[index].title),
                  subtitle: Text("${data.groups[index].entities.length} items"),
                  children: data.groups[index].entities.map((e) => ListTile(
                    title: Text(e.item),
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => AToZItemPage(aToZEntity: e,))),
                  )).toList()
                );
              }
            ),
          );
        }
      )
    );
  }
}
