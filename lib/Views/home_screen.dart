import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Views/Tabs/all_news.dart';
import 'package:news_app/Views/Tabs/breaking_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      animationDuration: const Duration(seconds: 1),
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(CupertinoIcons.sort_down),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(CupertinoIcons.search_circle),
            )
          ],
          centerTitle: true,
          title: const Text(
            'News',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
              indicatorColor: Color.fromARGB(255, 3, 36, 62),
              labelColor: Color.fromARGB(255, 3, 36, 62),
              tabs: [
                Text(
                  'Breaking News',
                  style: TextStyle(fontSize: 16),
                ),
                Text('All News'),
              ]),
        ),
        body: const TabBarView(children: [BreakingNews(), AllNews()]),
      ),
    );
  }
}
