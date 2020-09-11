class User {
  String token;
  String userEmail;
  String userNicename;
  String userDisplayName,username,password;

  User({this.token, this.userEmail, this.userNicename, this.userDisplayName,this.username,this.password});

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userEmail = json['user_email'];
    userNicename = json['user_nicename'];
    userDisplayName = json['user_display_name'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_email'] = this.userEmail;
    data['user_nicename'] = this.userNicename;
    data['user_display_name'] = this.userDisplayName;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
