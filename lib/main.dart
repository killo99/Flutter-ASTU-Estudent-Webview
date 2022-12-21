import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



void main() async{
  runApp(
    const MaterialApp(
      home: WebViewApp(),
    ),
  );
}

bool result=false;
checkNetwork() async{
   result = await InternetConnectionChecker().hasConnection;
}
class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  @override
  Widget build(BuildContext context){
    if(result == true) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: const WebView(
          initialUrl: 'https://estudent.astu.edu.et',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      );
    }else{
      return FittedBox(
        fit: BoxFit.fill,
        child: Image.asset("image/offline.jpg"),
        );
    }
  }
}
