class UserModel {
  UserModel(this.name, this.email, this.cpf) {
    loggedIn = false;
  }

  final String name;
  final String email;
  final String cpf;

  late bool loggedIn;

  Map<String, dynamic> toJson() => {'name': name, 'email': email, 'cpf': cpf};
}
