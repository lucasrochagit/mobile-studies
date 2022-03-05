import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SitePage extends StatelessWidget {
  WebViewController? controller;

  SitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Site"),
          actions: <Widget>[
            IconButton(onPressed: _onClickRefresh, icon: Icon(Icons.refresh))
          ],
        ),
        body: _body());
  }

  void _onClickRefresh() {
    controller?.reload();
  }

  _body() {
    return WebView(
      initialUrl: "https://google.com",
      onWebViewCreated: (controller) {
        this.controller = controller;
      },
      javascriptMode: JavascriptMode.unrestricted,
      navigationDelegate: (request) {
        print(request.url);
        return NavigationDecision.navigate;
      },
      // onPageStarted: (String url) {
      //   print('Page started loading: $url');
      // },
      // onPageFinished: (String url) {
      //   print('Page finished loading: $url');
      // },
    );
  }
}
