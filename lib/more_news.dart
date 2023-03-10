import 'package:flutter/material.dart';
import 'package:week4/model/article.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MoreNewsScreen extends StatelessWidget {
  static const routeName='/more_news';
  final Article article;
  const MoreNewsScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title)
      ),
      body: 
        WebView(
          initialUrl: article.url,
        )
    );
  }
}