class FactResponse {
  late int page;
  late int perPage;
  late int total;
  late int totalPages;
  late List<Data> data;
  late Support support;

  FactResponse(
      {required this.page,
        required this.perPage,
        required this.total,
        required this.totalPages,
        required this.data,
        required this.support});

  FactResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
        data= <Data>[];
      //data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    support =
    (json['support'] != null ? new Support.fromJson(json['support']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.support != null) {
      data['support'] = this.support.toJson();
    }
    return data;
  }
}

class Data {
  late int id;
  late String email;
  late String firstName;
  late String lastName;
  late String avatar;

  Data({required this.id, required this.email, required this.firstName, required this.lastName, required this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Support {
  late String url;
  late String text;

  Support({required this.url, required this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}
