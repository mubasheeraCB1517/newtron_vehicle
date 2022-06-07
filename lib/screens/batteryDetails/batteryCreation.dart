import 'package:flutter/material.dart';
import '../../module/repositotories/batteryCreationRepo.dart';
import 'batteryScreen.dart';

class BatteryCreation extends StatefulWidget {
  const BatteryCreation({Key? key}) : super(key: key);

  @override
  State<BatteryCreation> createState() => _ColourCreationState();
}

class _ColourCreationState extends State<BatteryCreation> {
  final battery_name = TextEditingController();
  final specification = TextEditingController();
  final price = TextEditingController();
  final dealer_price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green[400]),
        centerTitle: true,
        backgroundColor: Colors.yellow[200],
        title: Text(
          "Battery",
          style: TextStyle(color: Colors.green[400]),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  "Battery Name :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            TextFormField(
              controller: battery_name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.green[400]!,
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  "Specification:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            TextFormField(
              controller: specification,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.green[400]!,
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  "Price:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            TextFormField(
              controller: price,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.green[400]!,
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  "Dealer Price:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            TextFormField(
              controller: dealer_price,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.green[400]!,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                battery_name.text.isEmpty == true &&
                    specification.text.isEmpty == true &&
                    price.text.isEmpty == true &&
                    dealer_price.text.isEmpty == true;
                BatteryCreationRepository()
                    .batteryCreation(battery_name.text, specification.text,
                        price.text, dealer_price.text)
                    .then((value) {
                  if (value["success"] == 1) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BatteryScreen()),
                    );
                  } else {}
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 100),
                child: const Center(
                  child: Text("Submit",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}