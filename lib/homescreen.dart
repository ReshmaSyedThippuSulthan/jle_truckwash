// import 'package:flutter/material.dart';
// //import 'package:uitask/loginscreen.dart';
// import 'package:flutter_webview_pro/platform_interface.dart';
// import 'package:flutter_webview_pro/webview_flutter.dart';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart'
    as webview_flutter_android;
import 'package:image_picker/image_picker.dart' as image_picker;
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;
  late WebViewController controller1;

  late WebViewController controller2;



  @override
  void initState() {
    super.initState();
      controller1 = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
      ))
      ..loadRequest(Uri.parse(
          "https://web.miniextensions.com/grvcChcPiixEvOc50GZo"));

    initFilePicker1();

    controller2 = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
      ))
      ..loadRequest(Uri.parse(
          "https://app.miniextensions.com/user-portal-grid/J33tuCU22GPu7ymtN2M0"));
    initFilePicker2();
  }

  initFilePicker1() async {
    if (Platform.isAndroid) {
      final androidController = (controller1.platform
          as webview_flutter_android.AndroidWebViewController);
      await androidController.setOnShowFileSelector(_androidFilePicker);
    }
  }
  initFilePicker2() async {
    if (Platform.isAndroid) {
      final androidController = (controller1.platform
          as webview_flutter_android.AndroidWebViewController);
      await androidController.setOnShowFileSelector(_androidFilePicker);
    }
  }

    Future<List<String>> _androidFilePicker(
      webview_flutter_android.FileSelectorParams params) async {
    if (params.acceptTypes.any((type) => type == 'image/*')) {
      final picker = image_picker.ImagePicker();
      final photo =
          await picker.pickImage(source: image_picker.ImageSource.camera);

      if (photo == null) {
        return [];
      }
      return [Uri.file(photo.path).toString()];
    } else if (params.acceptTypes.any((type) => type == 'video/*')) {
      final picker = image_picker.ImagePicker();
      final vidFile = await picker.pickVideo(
          source: ImageSource.camera, maxDuration: const Duration(seconds: 10));
      if (vidFile == null) {
        return [];
      }
      return [Uri.file(vidFile.path).toString()];
    } else {
      try {
        if (params.mode ==
            webview_flutter_android.FileSelectorMode.openMultiple) {
          final attachments =
              await FilePicker.platform.pickFiles(allowMultiple: true);
          if (attachments == null) return [];

          return attachments.files
              .where((element) => element.path != null)
              .map((e) => File(e.path!).uri.toString())
              .toList();
        } else {
          final attachment = await FilePicker.platform.pickFiles();
          if (attachment == null) return [];
          File file = File(attachment.files.single.path!);
          return [file.uri.toString()];
        }
      } catch (e) {
        return [];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        title: Text(_selectedIndex == 0 ? "Add Task" : "Task List"),
      ),
      body: _selectedIndex == 0
          ? WebViewWidget(controller: controller1)
          : WebViewWidget(controller: controller2),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Add Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Task List',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}




