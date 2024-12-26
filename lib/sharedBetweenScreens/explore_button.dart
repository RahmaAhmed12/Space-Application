import 'package:flutter/material.dart';

class ExploreButton extends StatelessWidget {
  final String routeName;
  final String buttonText;
  final Color buttonColor = const Color(0xFFEE403D);
  final double top ;
  final double left ;
  final String? planetName;
  // Constructor accepting routeName and buttonText as parameters
  const ExploreButton({
    super.key,
    required this.routeName,  // routeName parameter
    required this.buttonText,
    required this .top,
    required this.left,
    this.planetName,

  });

  @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding:  EdgeInsets.only(top: top, left: left),
  //     child: ElevatedButton(
  //       onPressed: () {
  //         Navigator.pushReplacementNamed(context, routeName); // Use routeName parameter
  //       },
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: buttonColor,
  //         fixedSize: const Size(380, 60),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Expanded(
  //             child: Text(
  //               'Explore $buttonText', // Use buttonText parameter
  //               style: const TextStyle(color: Colors.white, fontSize: 20),
  //             ),
  //           ),
  //           const Icon(
  //             Icons.arrow_forward_sharp,
  //             color: Colors.white,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left),
      child: ElevatedButton(
        onPressed: () {

          if (planetName != null) {
            Navigator.pushNamed(
              context,
              routeName,
              arguments: planetName,
            );

          } else {
            Navigator.pushReplacementNamed(context, routeName);
          }

        },
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          fixedSize: const Size(380, 60),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Explore $buttonText', // Use buttonText parameter
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
