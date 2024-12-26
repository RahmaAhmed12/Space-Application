import 'package:flutter/material.dart';
import 'package:spacesystem/sharedBetweenScreens/explore_button.dart';
import 'package:spacesystem/home/home.dart';

class Login extends StatelessWidget {
  static String routeName = 'login';

  final Color background = const Color(0xFFFF010609);
  final Color buttonColor = const Color(0xFFEE403D);

  const Login({super.key} );

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: Stack(
          children: [

            Expanded(
            child: Image.asset( 'assets/images/background.png'),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(right: 200),
                child: Text('Explore \nThe\nUniverse',
                  style: TextStyle( color: Colors.white , fontWeight: FontWeight.bold , fontSize: 48),
                ),
              )
            ),

           ExploreButton(routeName: Home.routeName, buttonText: '',top: 730,left: 16,)


          ],
        )
      ),
    );

  }

}
