import 'package:flutter/material.dart';
import 'package:hemobile/pages/profile/ProfileButton.dart';

class ProfileBottomRow extends StatelessWidget {
  const ProfileBottomRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileButton(
          text: 'Agendamentos',
          route: '/agendamentos',
          icon: Icons.document_scanner,
        ),
        SizedBox(width: 30),
        ProfileButton(
          text: 'Historico',
          route: '/history',
          icon: Icons.watch_rounded,
        )
      ],
    );
  }
}
