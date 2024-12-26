
import 'package:flutter/material.dart';
import 'package:spacesystem/sharedBetweenScreens/create_appbar.dart';

import 'package:spacesystem/sharedBetweenScreens/explore_button.dart';
import 'package:spacesystem/informationScreen/info.dart';

class Home extends StatefulWidget {
  static String routeName = 'home';

  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final Color background = const Color(0xFF010609);
  final Color buttonColor = const Color(0xFFEE403D);

  final Map<String, Image> planetsMap = {
    'Earth': Image.asset('assets/images/planets/earth.png'),
    'Jupiter': Image.asset('assets/images/planets/jupiter.png'),
    'Mars': Image.asset('assets/images/planets/mars.png'),
    'Mercury': Image.asset('assets/images/planets/mercury.png'),
    'Neptune': Image.asset('assets/images/planets/neptune.png'),
    'Saturn': Image.asset('assets/images/planets/saturn.png'),
    'Sun': Image.asset('assets/images/planets/sun.png'),
    'Uranus': Image.asset('assets/images/planets/uranus.png'),
    'Venus': Image.asset('assets/images/planets/venus.png'),
  };

  final PageController planetsController = PageController();
  String currentPlanet = 'Earth'; // Default starting planet



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          toolbarHeight: 237,
          flexibleSpace: CreateAppBar(title: 'Explore', text: 'Which Planet\nwould you Like to explore ?', appBarHeight: 237)
        ),

        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 470,
              color: background,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // PageView for planets
                  Expanded(
                    child: PageView.builder(
                      controller: planetsController,

                      onPageChanged: (index) {
                        setState(() {
                          currentPlanet = planetsMap.keys.toList()[index];
                        });
                      },
                      itemCount: planetsMap.length,
                      itemBuilder: (context, index) {
                        final planetImage = planetsMap.values.toList()[index];
                        return Center(
                          child: Image(
                            image: planetImage.image,
                            width: 300,
                            height: 300,
                          ),
                        );
                      },
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        createButton(Icons.arrow_back_sharp, buttonColor ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: createText(currentPlanet),
                          ),
                        ),
                        createButton(Icons.arrow_forward_sharp, buttonColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Push the button to the bottom
            ExploreButton(
              routeName: InformationScreen.routeName,
              buttonText: currentPlanet,
              top: 494,
              left: 16,
              planetName: currentPlanet,
            ),
          ],
        ),
      ),
    );
  }

///**************************************************************************************///
  Widget createButton(IconData icon, Color buttonColor ) {
    return ElevatedButton(
      onPressed: () {
        // Handle page navigation
        if (icon == Icons.arrow_back_sharp) {
          planetsController.previousPage(
            duration: const Duration(milliseconds: 600),  // Adjust duration here
            curve: Curves.easeInOut,
          );
          //print(planet);
        } else {
          planetsController.nextPage(
            duration: const Duration(milliseconds: 600),  // Adjust duration here
            curve: Curves.easeInOut,
          );
         // print(planet);
        }
       // print(planet);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(2),
        fixedSize: const Size(24, 24),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 22,
      ),
    );
  }


  Widget createText(String txt) {
    return Text(
      txt,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

