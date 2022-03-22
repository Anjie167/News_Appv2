import 'dart:convert';

Login loginFromMap(String str) => Login.fromMap(json.decode(str));

String loginToMap(Login data) => json.encode(data.toMap());

class Login {
  Login({
    required this.info,
    required this.item,
  });

  Info info;
  List<Item> item;

  factory Login.fromMap(Map<String, dynamic> json) => Login(
    info: Info.fromMap(json["info"]),
    item: List<Item>.from(json["item"].map((x) => Item.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "info": info.toMap(),
    "item": List<dynamic>.from(item.map((x) => x.toMap())),
  };
}

class Info {
  Info({
    required this.postmanId,
    required this.name,
    required this.schema,
  });

  String postmanId;
  String name;
  String schema;

  factory Info.fromMap(Map<String, dynamic> json) => Info(
    postmanId: json["_postman_id"],
    name: json["name"],
    schema: json["schema"],
  );

  Map<String, dynamic> toMap() => {
    "_postman_id": postmanId,
    "name": name,
    "schema": schema,
  };
}

class Item {
  Item({
    required this.name,
    required this.id,
    required this.request,
    required this.response,
  });

  String name;
  String id;
  Request request;
  List<dynamic> response;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    name: json["name"],
    id: json["id"],
    request: Request.fromMap(json["request"]),
    response: List<dynamic>.from(json["response"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "id": id,
    "request": request.toMap(),
    "response": List<dynamic>.from(response.map((x) => x)),
  };
}

class Request {
  Request({
    required this.method,
    required this.header,
    required this.body,
    required this.url,
  });

  String method;
  List<dynamic> header;
  Body body;
  String url;

  factory Request.fromMap(Map<String, dynamic> json) => Request(
    method: json["method"],
    header: List<dynamic>.from(json["header"].map((x) => x)),
    body: Body.fromMap(json["body"]),
    url: json["url"],
  );

  Map<String, dynamic> toMap() => {
    "method": method,
    "header": List<dynamic>.from(header.map((x) => x)),
    "body": body.toMap(),
    "url": url,
  };
}

class Body {
  Body({
    required this.mode,
    required this.raw,
    required this.options,
  });

  String mode;
  String raw;
  Options options;

  factory Body.fromMap(Map<String, dynamic> json) => Body(
    mode: json["mode"],
    raw: json["raw"],
    options: Options.fromMap(json["options"]),
  );

  Map<String, dynamic> toMap() => {
    "mode": mode,
    "raw": raw,
    "options": options.toMap(),
  };
}

class Options {
  Options({
    required this.raw,
  });

  Raw raw;

  factory Options.fromMap(Map<String, dynamic> json) => Options(
    raw: Raw.fromMap(json["raw"]),
  );

  Map<String, dynamic> toMap() => {
    "raw": raw.toMap(),
  };
}

class Raw {
  Raw({
    required this.language,
  });

  String language;

  factory Raw.fromMap(Map<String, dynamic> json) => Raw(
    language: json["language"],
  );

  Map<String, dynamic> toMap() => {
    "language": language,
  };
}
