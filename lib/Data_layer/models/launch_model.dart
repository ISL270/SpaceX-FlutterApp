class LaunchModel {
  Links? links;
  String? rocket;
  List<String>? payloads;
  String? launchpad;
  String? name;
  String? dateUtc;

  LaunchModel(
      {this.links,
      this.rocket,
      this.payloads,
      this.launchpad,
      this.name,
      this.dateUtc});

  LaunchModel.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    rocket = json['rocket'];
    payloads = json['payloads'].cast<String>();
    launchpad = json['launchpad'];
    name = json['name'];
    dateUtc = json['date_utc'];
  }
}

class Links {
  String? webcast;

  Links({this.webcast});

  Links.fromJson(Map<String, dynamic> json) {
    webcast = json['webcast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['webcast'] = this.webcast;
    return data;
  }
}
