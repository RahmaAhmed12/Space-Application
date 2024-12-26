import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

import 'package:spacesystem/sharedBetweenScreens/create_appbar.dart';

class InformationScreen extends StatelessWidget {
  static String routeName = 'information';
  final Color background = const Color(0xFF010609);
  final Color buttonColor = const Color(0xFFEE403D);
  Flutter3DController controller = Flutter3DController();

  @override
  Widget build(BuildContext context) {
    final String planetName = ModalRoute.of(context)?.settings.arguments as String;
    String planetText = findPlanetText(planetName);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: backButton(context, buttonColor),
          toolbarHeight: 160,
          flexibleSpace: CreateAppBar(title: planetName, text: planetText, appBarHeight: 160),
        ),
        body: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1, // Adjust as needed
                  child: show3dModels(planetName)
                ),

                infoAboutPlanet(planetName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



//------------------------------------------------------------------------------------//
String findPlanetText(String planetName) {
  switch (planetName) {
    case 'Jupiter':
      return 'Jupiter: The Gas Giant';
    case 'Mars':
      return 'Mars: The Red Planet';
    case 'Mercury':
      return 'Mercury: The Closest Planet';
    case 'Neptune':
      return 'Neptune: The Distant World';
    case 'Saturn':
      return 'Saturn: The Ringed Planet';
    case 'Sun':
      return "The Sun: Our Solar System's Star";
    case 'Uranus':
      return 'Uranus: The Tilted Planet';
    case 'Venus':
      return "Venus: Earth's Toxic Twin";
    default:
      return 'Earth: Our Blue Marble';
  }
}
//------------------------------------------------------------------------------------//
Widget backButton(BuildContext context, Color buttonColor ){
  return Padding(padding: EdgeInsets.only(bottom: 60 ,left: 10),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pop(context); // Wrap in a closure
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(2),
        fixedSize: const Size(16, 16),
      ),
      child: Icon(
        Icons.arrow_back_sharp,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
}
//------------------------------------------------------------------------------------//
Widget infoAboutPlanet (String planetName){

  switch (planetName) {
    case 'Jupiter':
      return info(aboutText: 'Jupiter is the largest planet in our solar system, a gas giant composed primarily of hydrogen and helium. Its Great Red Spot, a massive storm that has been raging for centuries, is a testament to its turbulent atmosphere. Jupiter has a strong magnetic field and numerous moons, including Europa, which is believed to have a subsurface ocean that could potentially harbor life.',
          distance: '778,547,669', lengthOfDay: '9.92', earthYear: '11.86', radius: '69,911', mass: '1.898 × 10²⁷', gravity: '24.79', area: '6.21 × 10¹⁵');
    case 'Mars':
      return info(aboutText: "Mars, often called the Red Planet due to its reddish hue caused by iron oxide, is a cold, rocky world with a thin atmosphere. It has polar ice caps, ancient riverbeds, and evidence of past volcanic activity, suggesting that it once had a warmer, wetter climate. Mars is a prime target for exploration due to its potential for past or present life, and NASA's Perseverance rover is currently searching for signs of ancient microbial life on the planet's surface.",
          distance: '227,943,824', lengthOfDay: '24.62', earthYear: '1.88', radius: '3,389.50', mass: '6.39 × 10²³', gravity: '3.71', area: '1.45 × 10⁸');
    case 'Mercury':
      return info(aboutText: "The Sun is the heart of our solar system, a massive ball of plasma that provides heat, light, and energy to everything within its gravitational pull. Its immense size and temperature are fueled by nuclear fusion, a process that combines hydrogen atoms into helium, releasing vast amounts of energy. The Sun's magnetic field, which is constantly changing, influences solar activity like sunspots and solar flares, affecting space weather and potentially disrupting Earth-based technologies.",
          distance: '57,909,227', lengthOfDay: '1,407.60', earthYear: '0.24', radius: '2,439.70', mass: '3.301 × 10²³', gravity: '3.7', area: '7.48 × 10⁷');
    case 'Neptune':
      return info(aboutText: "Neptune is the farthest planet from the Sun and is another ice giant. Its atmosphere is similar to Uranus, but it is a deeper blue color due to the presence of methane. Neptune has several moons, including Triton, which orbits the planet in a retrograde direction and is believed to be a captured Kuiper Belt object.",
          distance: '4,498,252,900', lengthOfDay: '16.11', earthYear: '164.8', radius: '24,622', mass: '1.024 × 10²⁶', gravity: '11.15', area: '7.65 × 10¹⁵');
    case 'Saturn':
      return info(aboutText: "Saturn is best known for its spectacular rings, which are composed of countless ice particles and rocks. It is a gas giant with a composition similar to Jupiter, but its rings and moons give it a distinct appearance. Saturn's largest moon, Titan, has a thick atmosphere and is the only known celestial body outside of Earth with liquid lakes and rivers.",
          distance: '1,426,666,422', lengthOfDay: '10.66', earthYear: '29.46', radius: '58,232', mass: '5.683 × 10²⁶', gravity: '10.44', area: '4.27 × 10¹⁵');
    case 'Sun':
      return info(aboutText: "The Sun is the heart of our solar system, a massive ball of plasma that provides heat, light, and energy to everything within its gravitational pull. Its immense size and temperature are fueled by nuclear fusion, a process that combines hydrogen atoms into helium, releasing vast amounts of energy. The Sun's magnetic field, which is constantly changing, influences solar activity like sunspots and solar flares, affecting space weather and potentially disrupting Earth-based technologies.",
          distance: '0', lengthOfDay: '0', earthYear: '0', radius: '695,700', mass: '1.989 × 10³⁰', gravity: "274", area: '6.09 × 10¹²');
    case 'Uranus':
      return info(aboutText: "Uranus is an ice giant with a unique axial tilt, causing its seasons to be extreme. It is surrounded by faint rings and has numerous moons, including Miranda, known for its chaotic terrain. Uranus's atmosphere is composed primarily of hydrogen, helium, and methane, giving it a pale blue color.",
          distance: '2,870,990,000', lengthOfDay: '17.24', earthYear: '84.01', radius: '25,362', mass: '8.681 × 10²⁵', gravity: '8.69', area: '8.1 × 10¹⁵');
    case 'Venus':
      return info(aboutText: "Venus is often referred to as Earth's twin due to its similar size and composition. However, its thick atmosphere, composed primarily of carbon dioxide, traps heat, making it the hottest planet in our solar system. This greenhouse effect has created a hostile environment with temperatures hot enough to melt lead. Venus is also shrouded in a thick layer of sulfuric acid clouds, which reflect sunlight and give it a yellowish appearance.",
          distance: '108,209,072', lengthOfDay: '5,832.20', earthYear: '0.62', radius: '6,051.80', mass: '4.867 × 10²⁴', gravity: '8.87', area: '4.60 × 10⁸');
    default:
      return info(aboutText: "Earth is the only known planet in the universe that supports life. Its unique combination of factors, including liquid water, a breathable atmosphere, and a suitable distance from the Sun, has created the ideal conditions for the development of complex organisms. Earth's magnetic field protects it from harmful solar radiation, and its atmosphere helps to regulate temperature and weather patterns.",
          distance: '149,598,026', lengthOfDay: '23.93', earthYear: '1', radius: '6,371', mass: '5.972 × 10²⁴', gravity: '9.81', area: '5.10 × 10⁸');
  }

}
//-----------------------------------------------------------------------------------//
Widget info({required String aboutText, required String distance,
  required String lengthOfDay, required String earthYear, required String radius,
  required String mass, required String gravity, required String area,
})
{
  return Padding(
    padding: EdgeInsets.only(left: 18, top: 5),
    child: SingleChildScrollView( // Add this wrapper
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("About", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),

          const SizedBox(height: 6),
          Text(aboutText, style: const TextStyle(color: Colors.white, fontSize: 16)),

          const SizedBox(height: 14),
          Text('Distance from Sun (km): $distance', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),
          Text('Length of Day (hours): $lengthOfDay', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),
          Text('Orbital Period (Earth years): $earthYear', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),
          Text('Radius (km) : $radius', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),
          Text('Mass (kg): $mass', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),
          Text('Gravity (m/s²): $gravity', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),
          Text('Surface Area (km²): $area', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),


          // Remove redundant repetitive lines for distance to clean up code
        ],
      ),
    ),
  );
}
//------------------------------------------------------------------------------------//

Widget model(String path) {
   Flutter3DController controller = Flutter3DController();

  return Flutter3DViewer(
    activeGestureInterceptor: true,
    progressBarColor:Color(0xFFEE403D),
    enableTouch: true,
    controller: controller, // Use the initialized controller
    src:path,
  );
}

Widget show3dModels(String planetName){
  switch (planetName) {
    case 'Jupiter':
      return model('assets/3D_models/jupiter.glb');
    case 'Mars':
      return model('assets/3D_models/mars.glb');
    case 'Mercury':
      return model('assets/3D_models/mercury.glb');
    case 'Neptune':
      return model('assets/3D_models/neptune.glb');
    case 'Saturn':
      return model('assets/3D_models/saturn.glb');
    case 'Sun':
      return model('assets/3D_models/sun.glb');
    case 'Uranus':
      return model('assets/3D_models/uranus.glb');
    case 'Venus':
      return model('assets/3D_models/venus.glb');
    default:
      return model('assets/3D_models/earth.glb');
  }
}
