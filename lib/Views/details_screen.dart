import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CachedNetworkImage(
              height: 250,
              width: double.maxFinite,
              imageUrl: widget.newsModel.urlToImage.toString(),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              height: 12,
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
                    widget.newsModel.source!.name.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  widget.newsModel.publishedAt.toString(),
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.newsModel.title.toString(),
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Written By ${widget.newsModel.author}',
                softWrap: true,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(
              color: Colors.blueGrey,
              thickness: 1,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.newsModel.description.toString(),
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            OutlinedButton(
                onPressed: () async {
                  final Uri uri = Uri.parse(widget.newsModel.url.toString());
                  if (!await launchUrl(uri)) {
                    throw Exception('Could not lauch');
                  }
                },
                child: const Text(
                  'Read More...',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 4, 32, 56),
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
