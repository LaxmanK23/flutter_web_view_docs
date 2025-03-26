import 'package:flutter/material.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';

void main() {
  WebViewPlatform.instance = WebWebViewPlatform();
  runApp(MaterialApp(home: Scaffold(body: See())));
}

webViewExample({required BuildContext context, required String url}) {
  final PlatformWebViewController controller = PlatformWebViewController(
    const PlatformWebViewControllerCreationParams(),
  )..loadRequest(LoadRequestParams(uri: Uri.parse(url)));
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('WebView'),
                IconButton(icon: const Icon(Icons.download), onPressed: () {}),
              ],
            ),
            content: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: PlatformWebViewWidget(
                PlatformWebViewWidgetCreationParams(controller: controller),
              ).build(context),
            ),
          );
        },
      );
    },
  );
}

class See extends StatefulWidget {
  const See({super.key});

  @override
  SeeState createState() => SeeState();
}

class SeeState extends State<See> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebView Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            webViewExample(
              context: context,
              url:
                  'https://view.officeapps.live.com/op/view.aspx?src=https://storage.googleapis.com/voyagexprivate/tenants%2Ffivestars-qmlbe%2Fsms_forms_files%2FoIBYNy5TW4lh5ckgou4i.xls',
            );
          },
          child: const Text('Open WebView'),
        ),
      ),
    );
  }
}
