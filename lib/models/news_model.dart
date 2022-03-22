// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

News newsFromMap(String str) => News.fromMap(json.decode(str));

String newsToMap(News data) => json.encode(data.toMap());

class News {
  News({
    required this.status,
    required this.statusCode,
    required this.version,
    required this.access,
    required this.data,
  });

  String status;
  int statusCode;
  String version;
  String access;
  List<Datum> data;

  factory News.fromMap(Map<String, dynamic> json) => News(
    status: json["status"],
    statusCode: json["status-code"],
    version: json["version"],
    access: json["access"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "status-code": statusCode,
    "version": version,
    "access": access,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Datum {
  Datum({
    required this.newsId,
    required this.title,
    required this.summary,
    // required this.link,
    required this.published,
  });

  String title;
  int newsId;
  String summary;
  // String link;
  String published;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    newsId: json['id'],
    title: json["title"],
    summary: json["summary"] ?? '',
    // link: json["link"],
    published: json["published"],
  );
  Map<String, dynamic> toMap() => {
    "id": newsId,
    "title": title,
    "summary": summary,
    // "link": link,
    "published": published,
  };
}
