import 'package:flutter/material.dart';
import 'package:hemobile/pages/profile/ProfileDataLine.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileDataLine(label: 'Nome: ', data: 'Nome do usuário'),
          ProfileDataLine(label: 'Naturalidade: ', data: 'Brasileira'),
          ProfileDataLine(label: 'CPF: ', data: '110.289.814-73'),
          ProfileDataLine(label: 'Fator RH: ', data: '+'),
          ProfileDataLine(label: 'N° de doador: ', data: '4124451'),
        ],
      ),
    );
  }
}
