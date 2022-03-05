import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SitePage extends StatefulWidget {
  SitePage({Key? key}) : super(key: key);

  @override
  State<SitePage> createState() => _SitePageState();
}

class _SitePageState extends State<SitePage> {
  WebViewController? controller;

  var _showProgress = true;

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
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: WebView(
                initialUrl: "https://youtube.com",
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
                onPageFinished: _onPageFinished,
              ),
            )
          ],
        ),
        Opacity(
          opacity: _showProgress ? 1 : 0,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }

  void _onPageFinished(String value) {
    setState(() {
      _showProgress = false;
    });
  }
}
