import 'package:flutter/material.dart';
import 'package:recipie/presentation/pages/look_n_feel_page.dart';
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(horizontal: 20),
              title: Row(
                children: [
                  const Icon(Icons.settings),
                  const SizedBox(width: 10,),
                  const Text("Settings",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                ],
              ),
              background: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      image: DecorationImage(image: AssetImage("lib/core/assets/food_doodles.png"),fit: BoxFit.cover),
                    ),
                  ),
                  /*Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: .center,
                        colors: [
                          Theme.of(context).colorScheme.surface,
                          Theme.of(context).colorScheme.surface.withAlpha(0),
                        ],
                      )
                    ),
                  ),*/
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: .bottomCenter,
                        end: .topCenter,
                        colors: [
                          Theme.of(context).colorScheme.surface,
                          Theme.of(context).colorScheme.surface.withAlpha(0),
                        ],
                      )
                    ),
                  )
                ],
              )
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.color_lens,color: Theme.of(context).colorScheme.primary,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    title: const Text("Look N Feel"),
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const LookNFeelPage())),
                  ),
                  ListTile(
                    leading: Icon(Icons.history, color: Theme.of(context).colorScheme.primary,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    title:  Text("History"),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip, color: Theme.of(context).colorScheme.primary,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    title: const Text("Privacy policy"),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.info, color: Theme.of(context).colorScheme.primary,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    title: const Text("About"),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.download, color: Theme.of(context).colorScheme.primary,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    title: const Text("Check for update"),
                    onTap: (){},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
