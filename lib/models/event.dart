class event {
  String? name;
  String? date;
  int? ownerId;

  event({this.name, this.date, this.ownerId});

  event.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
    ownerId = json['owner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['date'] = this.date;
    data['owner_id'] = this.ownerId;
    return data;
  }
}