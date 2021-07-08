import 'package:flutter/material.dart';
import 'package:hemobile/pages/login/login.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage('assets/images/landing.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              color: Colors.black.withOpacity(0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 180,
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.red,
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/login',
                        arguments: LoginInputType.Login,
                      ),
                      child: Text('ENTRAR'),
                    ),
                  ),
                  Container(
                    width: 180,
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/login',
                        arguments: LoginInputType.Register,
                      ),
                      child: Text('CADASTRAR-SE'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
