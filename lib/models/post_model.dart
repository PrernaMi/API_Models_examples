class Reactions {
  int dislikes;
  int likes;

  Reactions({required this.dislikes, required this.likes});

  //from json--> model
  factory Reactions.fromJson(Map<String, dynamic> json) {
    return Reactions(dislikes: json['dislikes'], likes: json['likes']);
  }
}

class Posts {
  int id;
  String title;
  String body;
  int userId;
  int views;
  List<dynamic> tags;
  Reactions reactions;

  Posts(
      {required this.id,
      required this.title,
      required this.body,
      required this.tags,
      required this.userId,
      required this.views,
      required this.reactions});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        tags: json['tags'],
        userId: json['userId'],
        views: json['views'],
        reactions: Reactions.fromJson(json['reactions']));
  }
}

class PostData {
  int total;
  int skip;
  int limit;
  List<Posts> posts;

  PostData(
      {required this.limit,
      required this.posts,
      required this.skip,
      required this.total});

  factory PostData.fromJson(Map<String, dynamic> json) {
    List<Posts> allPost = [];
    for (Map<String, dynamic> eachPost in json['posts']) {
      Posts post = Posts.fromJson(eachPost);
      allPost.add(post);
    }
    return PostData(
        limit: json['limit'],
        posts: allPost,
        skip: json['skip'],
        total: json['total']);
  }
}
