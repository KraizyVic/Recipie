import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.chevron_left,size: 30,color: Theme.of(context).colorScheme.primary,)),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("lib/core/assets/privacy_policy.md"),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Markdown(
              data: snapshot.data!,
              styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                  .copyWith(p: const TextStyle(fontSize: 16)),
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}
