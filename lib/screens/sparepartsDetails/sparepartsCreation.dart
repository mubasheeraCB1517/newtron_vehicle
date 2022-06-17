import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newtron_vehicle/screens/sparepartsDetails/sparepartsScreen.dart';
import '../../module/modelClasses/partsListModel.dart';
import '../../module/modelClasses/vehicleListModel.dart';
import '../../module/repositotories/partsListRepo.dart';
import '../../module/repositotories/sparepartsCreationRepo.dart';
import '../../module/repositotories/vehicleListRepo.dart';
import '../alertBox/alertBox.dart';

class SparePartsCreation extends StatefulWidget {
  const SparePartsCreation({Key? key, this.spareDetails}) : super(key: key);
  final spareDetails;

  @override
  State<SparePartsCreation> createState() => _ColourCreationState();
}

class _ColourCreationState extends State<SparePartsCreation> {
  final vechicle_identification_num = TextEditingController();
  final motor_num = TextEditingController();
  final customer_name = TextEditingController();
  final price = TextEditingController();

  VehicleList _vehicleList = VehicleList();
  String vehicleName = "";
  String vehicleId = "";
  List cusDealer = ["Dealer", "Customer"];
  String cd = "Dealer";
  PartsList _partsList = PartsList();
  String partsName = "";
  String partsId = "";

  @override
  void initState() {
    super.initState();
    VehicleListRepository().vehicleList().then((value) {
      setState(() {
        _vehicleList = value;
        vehicleName = value.data[0].vechicle_name;
        vehicleId = value.data[0].vechicle_id.toString();
        if (widget.spareDetails != null) {
          int index = value.data?.indexWhere((item) =>
              item.vechicle_name == widget.spareDetails["vechicle_name"]);
          vehicleName = value.data?[index].vechicle_name;
          vehicleId = value.data![index].vechicle_id.toString();
        }
      });
    });
    PartsListRepository().partsList().then((value) {
      setState(() {
        _partsList = value;
        partsName = value.data[0].parts;
        partsId = value.data[0].parts_id.toString();
        if (widget.spareDetails != null) {
          int index = value.data?.indexWhere(
              (item) => item.parts == widget.spareDetails["parts_name"]);
          partsName = value.data?[index].parts;
          partsId = value.data![index].parts_id.toString();
        }
      });
    });
    if (widget.spareDetails != null) {
      vechicle_identification_num.text =
          widget.spareDetails['vechicle_identification_num'];
      motor_num.text = widget.spareDetails['motor_num'];
      customer_name.text = widget.spareDetails['customer_name'];
      price.text = widget.spareDetails['price'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green[400]),
        centerTitle: true,
        backgroundColor: Colors.yellow[200],
        title: Text(
          "SpareParts ADD",
          style: TextStyle(color: Colors.green[400]),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "Vehicle Identification Number  :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: vechicle_identification_num,
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
                    "Motor Number :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: motor_num,
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
                    "Customer Name  :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: customer_name,
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
                    "Vehicle Name :",
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
                    items: _vehicleList.data?.map((item) {
                      return DropdownMenuItem(
                        value: item.vechicle_name,
                        onTap: () {
                          setState(() {
                            vehicleId = item.vechicle_id.toString();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(item.vechicle_name ?? ""),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        vehicleName = newValue.toString();
                      });
                    },
                    value: vehicleName,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "Spare Parts:",
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
                    items: _partsList.data?.map((item) {
                      return DropdownMenuItem(
                        value: item.parts,
                        onTap: () {
                          setState(() {
                            partsId = item.parts_id.toString();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(item.parts ?? ""),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        partsName = newValue.toString();
                      });
                    },
                    value: partsName,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "PRICE:",
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
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  vechicle_identification_num.text.isEmpty == true &&
                          motor_num.text.isEmpty == true &&
                          customer_name.text.isEmpty == true &&
                          vehicleId.isEmpty == true &&
                          partsId.isEmpty == true &&
                          price.text.isEmpty == true
                      ? SparePartsCreationRepository()
                          .sparepartsCreation(
                              vechicle_identification_num.text,
                              motor_num.text,
                              vehicleId,
                              customer_name.text,
                              partsId,
                              price.text,
                              widget.spareDetails != null
                                  ? widget.spareDetails["spare_id"].toString()
                                  : "0")
                          .then((value) {
                          if (value["success"] == 1) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SparePartsScreen()),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
