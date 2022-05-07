class Notifications {
  int? id;
  String? title;
  String? body;
  String? date;

  Notifications({this.id, this.title, this.body, this.date});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['date'] = date;
    return data;
  }
}
