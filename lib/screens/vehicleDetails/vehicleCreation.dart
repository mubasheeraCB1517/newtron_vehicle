import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newtron_vehicle/module/modelClasses/batteryListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/modelListModel.dart';
import 'package:newtron_vehicle/module/repositotories/batteryListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/modelListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleCreationRepo.dart';
import 'package:newtron_vehicle/screens/alertBox/alertBox.dart';
import 'package:newtron_vehicle/screens/vehicleDetails/vehicleScreen.dart';

class VehicleCreation extends StatefulWidget {
  const VehicleCreation({Key? key}) : super(key: key);

  @override
  State<VehicleCreation> createState() => _VehicleCreationState();
}

class _VehicleCreationState extends State<VehicleCreation> {
  // ignore: non_constant_identifier_names
  final model_name = TextEditingController();

  // ignore: non_constant_identifier_names
  final vehicle_name = TextEditingController();

  // ignore: non_constant_identifier_names
  final battery_name = TextEditingController();

  // ignore: non_constant_identifier_names
  final amount = TextEditingController();
  BatteryList _batteryList = BatteryList();
  ModelList _modelList = ModelList();
  String batteryName = "";
  String batteryId = "";
  String modelName = "";
  String modelId = "";

  @override
  void initState() {
    super.initState();
    BatteryListRepository().batteryList().then((value) {
      setState(() {
        _batteryList = value;
        batteryName = value.data[0].battery;
      });
    });
    ModelListRepository().modelList().then((value) {
      setState(() {
        _modelList = value;
        modelName = value.data[0].model;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green[400]),
        centerTitle: true,
        backgroundColor: Colors.yellow[200],
        title: Text(
          "Vehicle",
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
                  "Model Name:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Colors.grey)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: _modelList.data?.map((item) {
                    modelId = _modelList.data![0].model_id.toString();
                    return DropdownMenuItem(
                      value: item.model,
                      onTap: () {
                        setState(() {
                          modelId = item.model_id.toString();
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(item.model ?? ""),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      modelName = newValue.toString();
                    });
                  },
                  value: modelName,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  "Battery Name:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Colors.grey)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: _batteryList.data?.map((item) {
                    batteryId = _batteryList.data![0].battery_id.toString();
                    return DropdownMenuItem(
                      value: item.battery,
                      onTap: () {
                        setState(() {
                          batteryId = item.battery_id.toString();
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(item.battery ?? ""),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      batteryName = newValue.toString();
                    });
                  },
                  value: batteryName,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  "Amount:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            TextFormField(
              controller: amount,
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
                vehicle_name.text.isNotEmpty == true &&
                        amount.text.isNotEmpty == true &&
                        modelId.isNotEmpty == true &&
                        batteryId.isNotEmpty == true
                    ? VehicleCreationRepository()
                        .vehicleCreation(
                            vehicle_name.text, modelId, batteryId, amount.text)
                        .then((value) {
                        if (value["success"] == 1) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VehicleScreen()),
                          );
                        } else {
                          const AlertBox(
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
