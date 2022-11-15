import 'package:flutter/material.dart';

import 'account_model.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AccountModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Clone'),
        actions: [
          IconButton(
            onPressed: () {
              model.logout();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(model.getProfileImageUrl()),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      alignment: Alignment.bottomRight,
                      child: Stack(
                        alignment: Alignment.center,
                        children: const [
                          SizedBox(
                            width: 28,
                            height: 28,
                            child: FloatingActionButton(
                              onPressed: null,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: FloatingActionButton(
                              onPressed: null,
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  model.getNickName(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Column(
              children: const [
                Text(
                  '3',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '게시물',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Column(
              children: const [
                Text(
                  '0',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '팔로워',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Column(
              children: const [
                Text(
                  '0',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '팔로잉',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
