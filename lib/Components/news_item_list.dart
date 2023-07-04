import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:news_app/Views/details_screen.dart';

class NewsItemList extends StatelessWidget {
  const NewsItemList({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetails(newsModel: newsModel)));
      },
      child: Card(
        margin: const EdgeInsets.all(12),
        color: Colors.blue[100],
        elevation: 5,
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 8, top: 8),
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              CachedNetworkImage(
                height: 250,
                width: double.maxFinite,
                imageUrl: newsModel.urlToImage.toString(),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) {
                  return const Icon(Icons.error);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 25,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        color: const Color.fromARGB(255, 196, 225, 248),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      newsModel.source!.name.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    newsModel.publishedAt.toString(),
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                newsModel.title.toString(),
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
