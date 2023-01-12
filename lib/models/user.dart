class user {
  String? username;
  String? email;
  String? sexe;
  int? age;
  String? image;

  user({this.username, this.email, this.sexe, this.age, this.image});

  user.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    sexe = json['sexe'];
    age = json['age'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['sexe'] = this.sexe;
    data['age'] = this.age;
    data['image'] = this.image;
    return data;
  }
}