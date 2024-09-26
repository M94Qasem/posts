class Post {
  final String title;
  final String? imageUrl;
  final String content;

  Post({
    required this.title,
    this.imageUrl,
    required this.content,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      imageUrl: json['picture'],
      content: json['content'],
    );
  }
}
