class UserPost {
  late final int? userId;
  late final int? id;
  late final String? title;
  late final String? body;
  bool? checked;

  UserPost({this.userId, this.id, this.title, this.body, this.checked});

  factory UserPost.fromJson(Map<String, dynamic> json) => UserPost(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
        checked: false,
      );
}
