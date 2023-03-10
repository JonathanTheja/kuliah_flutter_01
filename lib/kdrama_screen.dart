import 'package:flutter/material.dart';
import 'package:week4/model/article.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:week4/news_screen_detail.dart';
import 'package:week4/model/kdrama.dart';

class KdramaScreen extends StatelessWidget {
  static const routeName = '/new_list';

  const KdramaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News App')),
      body: ListView.builder(
        itemCount: koreanDramaList.length,
        itemBuilder: (context, index) {
          final KoreanDrama kdrama = koreanDramaList[index];
          return InkWell(
            onTap: () {},
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset(kdrama.banner),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildItem(BuildContext context, Article article) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(
      article.urlToImage,
      width: 100,
    ),
    title: Text(article.title),
    subtitle: Text(article.author),
    onTap: () {
      //argument ini mau ngirim detailnya apa
      Navigator.pushNamed(context, DetailNewsScreen.routeName,
          arguments: article);
    },
  );
}
