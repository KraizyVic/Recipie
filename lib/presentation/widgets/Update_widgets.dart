import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../core/update/download_service.dart';
import '../../core/update/method_chanel.dart';

class UpdateModal extends StatelessWidget {
  final String version;
  final String changelog;
  final VoidCallback onUpdate;

  const UpdateModal({super.key, required this.version, required this.changelog, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('New Update Available • $version', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(changelog.isNotEmpty ? changelog : 'No changelog provided.'),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Later')),
                  const SizedBox(width: 8),
                  ElevatedButton(onPressed: onUpdate, child: const Text('Download')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
/// A simple dialog that shows download progress and a Cancel button.
class DownloadingDialog extends StatefulWidget {
  final VoidCallback onCancel;
  final double Function() progressProvider;

  const DownloadingDialog({super.key, required this.onCancel, required this.progressProvider});

  @override
  State<DownloadingDialog> createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  @override
  void initState() {
    super.initState();
    // We update progress every 200ms while open.
    WidgetsBinding.instance.addPostFrameCallback((_) => _tick());
  }

  void _tick() async {
    while (mounted) {
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = (widget.progressProvider() * 100).toStringAsFixed(0);
    return AlertDialog(
      title: const Text('Downloading update'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text('Downloading update — please do not exit the app.'),
        const SizedBox(height: 12),
        Row(
          children: [
            //Text('Progress: ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Spacer(),
            SizedBox(
              //color: Colors.blueAccent,
              height: 50,
              width: 50,
              child: Stack(
                children: [
                  //Positioned.fill(child: Center(child: CircularProgressIndicator(value: widget.progressProvider()))),
                  Center(child: Text('$progress%',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
          ],
        ),
        LinearProgressIndicator(value: widget.progressProvider()),
      ]
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.onCancel();
            // keep dialog open; download flow handles closing
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
*/

class UpdatePage extends StatefulWidget {
  final String url;
  const UpdatePage({super.key, required this.url});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  bool _isDownloading = false;
  bool _cancelRequested = false;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _startUpdate();
  }

  // We update progress every 200ms while open.
  void _tick() async {
    while (mounted) {
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 200));
    }
  }
  /// ⬇️ Handles the update download + install process
  Future<void> _startUpdate() async {
    final url = widget.url;
    setState(() {
      _isDownloading = true;
      _cancelRequested = false;
      _progress = 0.0;
    });

    final downloader = DownloadService();
    try {
      final path = await downloader.downloadApk(url, (p) {if (_cancelRequested) return;setState(() => _progress = p);}, () => _cancelRequested);
      if (_cancelRequested) {
        setState(() => _isDownloading = false);
        return;
      }

      await ApkInstaller.installApk(path);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Update failed: $e')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isDownloading = false;
          _progress = 0.0;
        });
        Navigator.of(context, rootNavigator: true).pop();
      }
    }
  }

  void cancelDialog(){
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
            title: Text("Are you sure you want to exit?"),
            content: Text("Download progress will be lost"),
            actions: [
              TextButton(onPressed: ()=>Navigator.pop(context), child: Text("Cancel")),
              TextButton(
                  onPressed: (){
                    setState(() {
                      _cancelRequested = true;
                    });
                    Navigator.pop(context);
                  },
                  child: Text("Exit")
              ),
            ]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,obj){
        if (didPop) return;
        cancelDialog();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Icon(Icons.download,size: 50,color: Theme.of(context).colorScheme.primary,),
              const SizedBox(height: 12),
              Text("Downloading\nUpdate",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,)),
              const SizedBox(height: 12),
              Text("${(_progress*100).toStringAsFixed(0)}%",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary)),
              const SizedBox(height: 12),
              LinearProgressIndicator(value: _progress),
              const SizedBox(height: 12),
              MaterialButton(
                onPressed: cancelDialog,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.red)),
                child: SizedBox(width: double.maxFinite,child: Center(child: Text("Cancel download",)))
              ),
              const SizedBox(height: 12),
              Text("* Please do not exit the app while update is downloading",textAlign: TextAlign.center,style: TextStyle(color: Theme.of(context).colorScheme.tertiary.withAlpha(100))),
            ]
          ),
        )
      ),
    );
  }
}



