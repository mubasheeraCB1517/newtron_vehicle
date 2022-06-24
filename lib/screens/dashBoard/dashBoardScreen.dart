import 'package:flutter/material.dart';
import 'package:newtron_vehicle/screens/colourDetails/colourScreen.dart';
import 'package:newtron_vehicle/screens/modelDetails/modelScreen.dart';
import 'package:newtron_vehicle/screens/services/servicesScreen.dart';
import 'package:newtron_vehicle/screens/vehicleBooking/vehicleAllottedScreen.dart';
import 'package:newtron_vehicle/screens/vehicleBooking/vehicleBookingScreen.dart';
import 'package:newtron_vehicle/screens/vehicleDetails/vehicleScreen.dart';
import 'package:newtron_vehicle/screens/vehicleRegistration/vehicleRgistrationScreen.dart';
import '../batteryDetails/batteryScreen.dart';
import '../customerDetails/customerScreen.dart';
import '../dealerRegistration/dealerRegistrationScreen.dart';
import '../partsDetails/partsScreen.dart';
import '../sparepartsBookingDetails/sparepartsBookingScreen.dart';
import '../sparepartsDetails/sparepartsScreen.dart';
import '../warrantyDeatils/warrantyDeatilsScreen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    void handleClick(int item) {
      switch (item) {
        case 0:
          break;
        case 1:
          break;
      }
    }
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
                  "Dealer List",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DealerScreen()),
                  );
                },
              ),
              ExpansionTile(
                title: Text(
                  "Vehicle Booking",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                children: [
                  ListTile(
                    title: Text(
                      "Vehicle Allotted",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const VehicleAllottedScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Registered Vehicle",
                      style: TextStyle(
                          fontSize: 16,
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
                  )
                ],
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
                        builder: (context) => const WarrantyScreen()),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomerScreen()),
                  );
                },
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
                        builder: (context) =>
                            const VehicleRegistrationScreen()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Spare Parts",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SparePartsScreen()),
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
                          fontSize: 16,
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
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PartsScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Model",
                      style: TextStyle(
                          fontSize: 16,
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
                          fontSize: 16,
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
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BatteryScreen()),
                      );
                    },
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  "Spare Parts Booking Enquiry",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SparePartsBookingScreen()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Vehicle Services",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ServicesScreen()),
                  );
                },
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
            actions: <Widget>[
              PopupMenuButton<int>(
                icon: Icon(Icons.person),
                onSelected: (item) => handleClick(item),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(value: 0, child: Text('Reset Password')),
                  PopupMenuItem<int>(value: 1, child: Text('Log Out')),
                ],
              ),
            ]
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.bottomCenter,
                  scale: 1,
                  image:
                      AssetImage("assets/images/newtron_vehicle.png"))),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const VehicleAllottedScreen()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.teal[100],
                  ),
                  padding: const EdgeInsets.all(8),

                  child: Center(child: const Text("Vehicle Alloted Pending",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center),)),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VehicleBookingScreen()),
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[200],
                    ),
                  padding: const EdgeInsets.all(8),

                  child: Center(child: const Text("Registered Vehicle",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center),)
                ),
              ),
              GestureDetector(

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SparePartsBookingScreen()),
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[200],
                    ),
                  padding: const EdgeInsets.all(8),

                  child: Center(child: const Text("Spare Parts Enquiry",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center),)
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ServicesScreen()),
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[100],
                    ),
                  padding: const EdgeInsets.all(8),

                  child: Center(child: const Text("Vehicle Services",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center),)
                ),
              ),

            ],
          )
        ));
  }
}
