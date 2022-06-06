import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newtron_vehicle/module/repositotories/modelCreationRepo.dart';
import 'package:newtron_vehicle/screens/alertBox/alertBox.dart';
import 'package:newtron_vehicle/screens/modelDetails/modelScreen.dart';

class ModelCreation extends StatefulWidget {
  const ModelCreation({Key? key}) : super(key: key);

  @override
  State<ModelCreation> createState() => _ModelCreationState();
}

class _ModelCreationState extends State<ModelCreation> {
  // ignore: non_constant_identifier_names
  final model_name = TextEditingController();

  // ignore: non_constant_identifier_names
  final vehicle_name = TextEditingController();

  // ignore: non_constant_identifier_names
  final specification = TextEditingController();
  final price = TextEditingController();

  // ignore: non_constant_identifier_names
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
          "Model",
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
                  "Model Name:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            TextFormField(
              controller: model_name,
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
                  "Vehicle Name:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            TextFormField(
              controller: vehicle_name,
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
                model_name.text.isNotEmpty == true &&
                        vehicle_name.text.isNotEmpty == true &&
                        specification.text.isNotEmpty == true &&
                        price.text.isNotEmpty == true &&
                        dealer_price.text.isNotEmpty == true
                    ? ModelCreationRepository()
                        .modelCreation(model_name.text, vehicle_name.text,
                            specification.text, price.text, dealer_price.text)
                        .then((value) {
                        if (value["success"] == 1) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ModelScreen()),
                          );
                        } else if (value["success"] == 0) {
                          return const AlertBox(
                            title: "Oh!",
                            image: "assets/images/warning.png",
                            content: "Something went wrong",
                          );
                        }
                      })
                    : Fluttertoast.showToast(
                        msg: "Please fill all the fields",
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_SHORT,
                      );
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
