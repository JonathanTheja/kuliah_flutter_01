import 'package:flutter/material.dart';
import 'package:week4/model/article.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:week4/news_screen_detail.dart';

class NewsScreen extends StatelessWidget {
  static const routeName='/new_list';

  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News')
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString("assets/news.json"),
        builder: (context, snapshot){
          final List<Article> articles = parseArticles(snapshot.data);
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index){
              return buildItem(context, articles[index]);
            },
          );
        }
      )
    );
  }
  
}

Widget buildItem(BuildContext context, Article article){
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(article.urlToImage, width: 100,),
    title: Text(article.title),
    subtitle: Text(article.author),
    onTap: (){
      //argument ini mau ngirim detailnya apa
      Navigator.pushNamed(context, DetailNewsScreen.routeName, arguments: article);
    },
  );
}