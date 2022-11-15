import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_renew/create/create_page.dart';
import 'package:instagram_clone_renew/detail_post/detail_post_page.dart';
import 'package:instagram_clone_renew/tab/search/search_model.dart';

import '../../domain/post.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  final List<String> _urls = const [
    'https://pbs.twimg.com/profile_images/1374979417915547648/vKspl9Et_400x400.jpg',
    'http://talkimg.imbc.com/TVianUpload/tvian/TViews/image/2022/01/05/0vU4v7vCfjju637769738893922804.jpg',
    'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202207/31/d399eb2b-154e-4585-bdbb-b8a86939577c.jpg',
    'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202207/31/d399eb2b-154e-4585-bdbb-b8a86939577c.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final model = SearchModel();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePage()),
          );
        },
        child: const Icon(Icons.create),
      ),
      appBar: AppBar(
        title: const Text('Instagram clone'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: StreamBuilder<QuerySnapshot<Post>>(
            stream: model.postsStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('알 수 없는 에러');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              List<Post> posts =
                  snapshot.data!.docs.map((e) => e.data()).toList();

              return GridView.builder(
                itemCount: posts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final post = posts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPostPage(post: post)),
                      );
                    },
                    child: Image.network(
                      post.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
