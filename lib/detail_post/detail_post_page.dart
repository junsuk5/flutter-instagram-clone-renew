import 'package:flutter/material.dart';

import '../domain/post.dart';
import 'detail_post_model.dart';

class DetailPostPage extends StatelessWidget {
  final Post post;

  const DetailPostPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = DetailPostModel();

    return Scaffold(
      appBar: AppBar(
        title: const Text('둘러보기'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(model.getProfileImageUrl()),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.getEmail(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(model.getNickName()),
                  ],
                ),
              ],
            ),
          ),
          Image.network(post.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.title),
          ),
        ],
      ),
    );
  }
}
