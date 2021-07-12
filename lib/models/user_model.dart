class UserModel {
  UserModel(this.name, this.email, this.cpf, this.password, this.bloodType,
      this.naturality, this.donorNumber) {
    loggedIn = false;
  }

  final String name;
  final String email;
  final String password;
  final String cpf;
  final String bloodType;
  final String naturality;
  final String donorNumber;

  late bool loggedIn;

  Map<String, dynamic> toJson() => {'name': name, 'email': email, 'cpf': cpf};

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(json['name'], json['email'], json['cpf'], json['password'],
        json['bloodType'], json['naturality'], json['donorNumber']);
  }
}
