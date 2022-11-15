class Post {
  String userId;
  String title;
  String imageUrl;

  Post({required this.userId, required this.title, required this.imageUrl});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'title': title,
      'imageUrl': imageUrl,
    };
  }
}
