import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rok/common/style/style.dart';
import 'package:rok/widget/common/yp_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewPage extends StatefulWidget {
  static final String sName = "webView";
  final String url;
  final String title;

  @override
  _WebViewPageState createState() => _WebViewPageState();

  WebViewPage({Key key, @required this.url, this.title = "谊批宝"})
      : super(key: key);
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
        appBar: YPAppBar("网页").build(context),
        body: Container(
          color: kAppBcgColor,
          child: Stack(
            children: <Widget>[
              Center(
                child: CircularProgressIndicator(),
              ),
              Builder(builder: (BuildContext context) {
                return WebView(
                  initialUrl: widget.url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                    webViewController.loadUrl(widget.url,
                        headers: {"Cookie": 'clientCommonlanguage=en'});
                  },
                  // ignore: prefer_collection_literals
                  javascriptChannels: <JavascriptChannel>[
                    _toasterJavascriptChannel(context),
                  ].toSet(),
                  navigationDelegate: (NavigationRequest request) {
                    print('allowing navigation to $request');
                    return NavigationDecision.navigate;
                  },
                  onPageStarted: (String url) {
                    print('Page started loading: $url');
                  },
                  onPageFinished: (String url) {
                    print('Page finished loading: $url');
                  },
                  gestureNavigationEnabled: true,
                );
              }),
            ],
          ),
        ));
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

//flutter调用js
//  _controller
//      ?.evaluateJavascript('callJS("visible")')
//      ?.then((result) {
//  // You can handle JS result here.
//  });

}
