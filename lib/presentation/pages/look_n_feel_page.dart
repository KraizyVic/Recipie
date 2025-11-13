import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipie/core/constants.dart';
import 'package:recipie/domain/entities/settings_page_entities.dart';
import 'package:recipie/presentation/state_management/settings_page_cubit.dart';

class LookNFeelPage extends StatefulWidget {
  const LookNFeelPage({super.key});

  @override
  State<LookNFeelPage> createState() => _LookNFeelPageState();
}

class _LookNFeelPageState extends State<LookNFeelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Look & Feel'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.chevron_left,color: Theme.of(context).colorScheme.primary,)),
      ),
      body: BlocBuilder<LookAndFeelCubit,LookAndFeelEntity>(
        builder: (context,state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Theme",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                  Column(
                    children: [
                      RadioListTile(
                        value: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: const Text('System'),
                        groupValue: state.themeMode,
                        onChanged: (value) {context.read<LookAndFeelCubit>().changeTheme(value!);},
                      ),
                      RadioListTile(
                        value: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: const Text('Light'),
                        groupValue: state.themeMode,
                        onChanged: (value) {context.read<LookAndFeelCubit>().changeTheme(value!);},
                      ),
                      RadioListTile(
                        value: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: const Text('Dark'),
                        groupValue: state.themeMode,
                        onChanged: (value) {context.read<LookAndFeelCubit>().changeTheme(value!);},
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Misc",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                  SwitchListTile(value: state.isAmoledBackground, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),), title: Text("Amoled Background"),onChanged: (value)=> context.read<LookAndFeelCubit>().setAmoledBackground(value),),
                  SwitchListTile(value: state.keepScreenOnOnRecipePage, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),), title: Text("Keep screen on in details page"),onChanged: (value)=> context.read<LookAndFeelCubit>().setKeepScreenOn(value),),
                  SizedBox(height: 10,),
                  Text("Colors",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                  SizedBox(height: 10,),
                  Column(
                    children: colorsList.map((color)=>ListTile(
                      title: Text(color.colorName),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(color.colorValue),
                          shape: BoxShape.circle,
                        ),
                      ),
                      trailing: state.primaryColor == color.colorValue ? const Icon(Icons.check_circle_outline) : null,
                      onTap: () {
                        context.read<LookAndFeelCubit>().setAppColor(color.colorValue);
                      },
                    )).toList(),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
