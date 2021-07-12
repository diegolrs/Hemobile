class UserModel {
  UserModel(this.name, this.email, this.cpf, this.bloodType, this.naturality,
      this.donorNumber, this.uuid) {
    loggedIn = false;
  }

  final String name;
  final String email;
  final String cpf;
  final String bloodType;
  final String naturality;
  final String donorNumber;
  final String uuid;

  late bool loggedIn;

  Map<String, dynamic> toJson() => {'name': name, 'email': email, 'cpf': cpf};

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        json['name'],
        json['email'],
        json['cpf'],
        json['bloodType'],
        json['naturality'],
        json['donorNumber'],
        json['uuid']);
  }
}
