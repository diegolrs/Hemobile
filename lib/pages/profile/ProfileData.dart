import 'package:flutter/material.dart';
import 'package:hemobile/models/user_model.dart';
import 'package:hemobile/pages/profile/ProfileDataLine.dart';

class ProfileData extends StatelessWidget {
  final UserModel user;

  const ProfileData({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileDataLine(label: 'Nome: ', data: user.name),
          ProfileDataLine(label: 'Naturalidade: ', data: user.naturality),
          ProfileDataLine(label: 'CPF: ', data: user.cpf),
          ProfileDataLine(label: 'Tipo sanguineo: ', data: user.bloodType),
          ProfileDataLine(label: 'N° de doador: ', data: user.donorNumber),
        ],
      ),
    );
  }
}
