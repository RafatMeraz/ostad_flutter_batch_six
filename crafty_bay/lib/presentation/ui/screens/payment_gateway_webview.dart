import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentGatewayWebview extends StatefulWidget {
  const PaymentGatewayWebview({super.key, required this.gatewayUrl});

  final String gatewayUrl;

  @override
  State<PaymentGatewayWebview> createState() => _PaymentGatewayWebviewState();
}

class _PaymentGatewayWebviewState extends State<PaymentGatewayWebview> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            debugPrint(request.url);
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.gatewayUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
}
