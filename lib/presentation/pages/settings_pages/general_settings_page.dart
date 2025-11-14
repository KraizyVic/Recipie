import 'package:flutter/material.dart';

class GeneralSettingsPage extends StatelessWidget {
  const GeneralSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Settings'),
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(Icons.chevron_left,size: 30,color: Theme.of(context).colorScheme.primary,),
        ),
      ),
    );
  }
}
