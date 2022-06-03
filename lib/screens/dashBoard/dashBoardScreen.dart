import 'package:flutter/material.dart';
import 'package:newtron_vehicle/screens/colourDetails/colourScreen.dart';
import 'package:newtron_vehicle/screens/modelDetails/modelScreen.dart';
import 'package:newtron_vehicle/screens/vehicleBooking/vehicleBookingScreen.dart';
import 'package:newtron_vehicle/screens/vehicleDetails/vehicleScreen.dart';
import 'package:newtron_vehicle/screens/vehicleRegistration/vehicleRgistrationScreen.dart';

import '../batteryDetails/batteryScreen.dart';
import '../dealerRegistration/dealerRegistrationScreen.dart';
import '../partsDetails/partsScreen.dart';
import '../warrantyDeatils/warrantyDeatilsScreen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                    child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          scale: 1,
                          image:
                              AssetImage("assets/images/newtron_vehicle.png"))),
                )),
              ),
              const SizedBox(
                height: 15,
              ),
              ListTile(
                title: Text(
                  "Dealer Registration",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const DealerScreen()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Vehicle Booking",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VehicleBookingScreen()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Warranty Request ",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const WarrantyScreen()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Customers",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Vehicle Registration",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VehicleRegistrationScreen()),
                  );
                },
              ),
              ExpansionTile(
                title: Text(
                  "Vehicle Details",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                children: [
                  ListTile(
                    title: Text(
                      "Vehicle",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VehicleScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Parts",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    onTap: () {
                      Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) =>
                           const PartsScreen()),
                     );},
                  ),
                  ListTile(
                    title: Text(
                      "Model",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ModelScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Colour",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ColourScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Battery",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    onTap: () {
                      Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) =>
                           const BatteryScreen()),
                     );},
                  ),
                ],

              ),
              ListTile(
                title: Text(
                  "Spare Parts Booking",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  "Reports",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "DASHBOARD",
            style: TextStyle(color: Colors.green[400]),
          ),
          backgroundColor: Colors.yellow[200]!,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.green[400]),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  scale: 2.5,
                  image:
                      AssetImage("assets/images/newtron_tr_icon-300x300.png"))),
        ));
  }
}
