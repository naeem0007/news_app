import 'package:flutter/material.dart';

import '../../Components/news_item_list.dart';
import '../../Model/news_model.dart';
import '../../Service/api_service.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: apiService.getallNews(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<NewsModel> articleList = snapshot.data ?? [];
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: articleList.length,
                    itemBuilder: (context, index) {
                      return NewsItemList(newsModel: articleList[index]);
                    });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
