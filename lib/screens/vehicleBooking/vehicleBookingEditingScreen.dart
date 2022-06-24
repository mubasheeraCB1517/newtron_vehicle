import 'package:flutter/material.dart';
import 'package:newtron_vehicle/module/modelClasses/batteryListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/colourListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/dealerListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/modelListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleStatusModel.dart';
import 'package:newtron_vehicle/module/repositotories/batteryListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/colourListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/dealerListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/modelListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleBookingSave.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleStatusRepo.dart';
import 'package:newtron_vehicle/screens/vehicleBooking/vehicleBookingScreen.dart';

class VehicleBookingEditing extends StatefulWidget {
  const VehicleBookingEditing({Key? key, this.vehicleBookingDetails})
      : super(key: key);
  final vehicleBookingDetails;

  @override
  State<VehicleBookingEditing> createState() => _VehicleBookingEditingState();
}

class _VehicleBookingEditingState extends State<VehicleBookingEditing> {
  final customer_name = TextEditingController();
  final contact_no = TextEditingController();
  final email = TextEditingController();
  final booking_date = TextEditingController();
  final vehicle_identification_num = TextEditingController();
  final motor_num = TextEditingController();
  String dealer_name = "";
  String dealer_id = "";
  DealerList dealerList = DealerList();
  VehicleList vehicleList = VehicleList();
  String vehicle_name = "";
  String vehicle_id = "";
  ModelList modelList = ModelList();
  String model_name = "";
  String model_id = "";
  BatteryList batteryList = BatteryList();
  String battery_name = "";
  String battery_id = "";
  ColourList colourList = ColourList();
  String colour_name = "";
  String colour_id = "";
  VehicleStatusList vehicleStatus = VehicleStatusList();
  String vehicle_status = "";
  String vehicle_status_id = "";

  @override
  void initState() {
    super.initState();
    DealerListRepository().dealerList().then((value) {
      setState(() {
        dealerList = value;
        dealer_name = value.data[0].dealer_name;
        dealer_id = value.data[0].id.toString();
        if (widget.vehicleBookingDetails != null) {
          int index = value.data?.indexWhere((item) =>
              item.id.toString() ==
              widget.vehicleBookingDetails["dealer_name"]);
          dealer_name = value.data?[index].dealer_name;
          dealer_id = value.data![index].id.toString();
          customer_name.text = widget.vehicleBookingDetails["customer_name"];
          email.text = widget.vehicleBookingDetails["customer_email"];
          contact_no.text = widget.vehicleBookingDetails["customer_no"];
          booking_date.text = widget.vehicleBookingDetails["booking_date"];
          vehicle_identification_num.text =
              widget.vehicleBookingDetails["vechicle_identification_num"];
          motor_num.text = widget.vehicleBookingDetails["motor_num"];
        }
      });
    });
    VehicleListRepository().vehicleList().then((value) {
      setState(() {
        vehicleList = value;
        vehicle_name = value.data[0].vechicle_name;
        vehicle_id = value.data[0].vechicle_id.toString();
        //print("item=${widget.vehicleBookingDetails.customer_name.toString()}");
        if (widget.vehicleBookingDetails != null) {
          int index = value.data!.indexWhere((item) =>
              item.vechicle_name.toString() ==
              widget.vehicleBookingDetails["vechicle_name"].toString());

          vehicle_name = value.data?[index].vechicle_name;
          vehicle_id = value.data![index].vechicle_id.toString();
        }
      });
    });
    ModelListRepository().modelList().then((value) {
      setState(() {
        modelList = value;
        model_name = value.data[0].model;
        model_id = value.data[0].model_id.toString();
        //print("item=${widget.vehicleBookingDetails.customer_name.toString()}");
        if (widget.vehicleBookingDetails != null) {
          int index = value.data!.indexWhere((item) =>
              item.model.toString() ==
              widget.vehicleBookingDetails["model_name"].toString());
          model_name = value.data?[index].model;
          model_id = value.data![index].model_id.toString();
        }
      });
    });
    BatteryListRepository().batteryList().then((value) {
      setState(() {
        batteryList = value;
        battery_name = value.data[0].battery;
        battery_id = value.data[0].battery_id.toString();
        if (widget.vehicleBookingDetails != null) {
          int index = value.data!.indexWhere((item) =>
              item.battery.toString() ==
              widget.vehicleBookingDetails["battery_name"].toString());
          battery_name = value.data?[index].battery;
          battery_id = value.data![index].battery_id.toString();
        }
      });
    });
    ColourListRepository().colourList().then((value) {
      setState(() {
        colourList = value;
        colour_name = value.data[0].color_name;
        colour_id = value.data[0].color_id.toString();
        if (widget.vehicleBookingDetails != null) {
          int index = value.data!.indexWhere((item) =>
              item.color_name.toString() ==
              widget.vehicleBookingDetails["color_name"].toString());
          colour_name = value.data?[index].color_name;
          colour_id = value.data![index].color_id.toString();
        }
      });
    });
    VehicleStatusRepository().vehicleStatusList().then((value) {
      setState(() {
        vehicleStatus = value;
        vehicle_status = value.data[0].vechicle_status;
        vehicle_status_id = value.data[0].id.toString();
        if (widget.vehicleBookingDetails != null) {
          int index = value.data!.indexWhere((item) =>
              item.vechicle_status.toString() ==
              widget.vehicleBookingDetails["vechicle_status"].toString());
          vehicle_status = value.data?[index].vechicle_status;
          vehicle_status_id = value.data![index].id.toString();
        }
      });
    });
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
          "Vehicle Booking Add",
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
                    "CUSTOMER NAME  :",
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
                    "CUSTOMER NUMBER :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: contact_no,
                keyboardType: TextInputType.phone,
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
                    "E-mail  :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: email,
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
                    "DEALER NAME :",
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
                    items: dealerList.data?.map((item) {
                      return DropdownMenuItem(
                        value: item.dealer_name,
                        onTap: () {
                          setState(() {
                            dealer_id = item.id.toString();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(item.dealer_name ?? ""),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        dealer_name = newValue.toString();
                      });
                    },
                    value: dealer_name,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "VECHICLE NAME:",
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
                    items: vehicleList.data?.map((item) {
                      return DropdownMenuItem(
                        value: item.vechicle_name,
                        onTap: () {
                          setState(() {
                            vehicle_id = item.vechicle_id.toString();
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
                        vehicle_name = newValue.toString();
                      });
                    },
                    value: vehicle_name,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "MODEL :",
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
                    items: modelList.data?.map((item) {
                      return DropdownMenuItem(
                        value: item.model,
                        onTap: () {
                          setState(() {
                            model_id = item.id.toString();
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
                        model_name = newValue.toString();
                      });
                    },
                    value: model_name,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "BATTERY :",
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
                    items: batteryList.data?.map((item) {
                      return DropdownMenuItem(
                        value: item.battery,
                        onTap: () {
                          setState(() {
                            battery_id = item.battery_id.toString();
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
                        battery_name = newValue.toString();
                      });
                    },
                    value: battery_name,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "COLOUR :",
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
                    items: colourList.data?.map((item) {
                      return DropdownMenuItem(
                        value: item.color_name,
                        onTap: () {
                          setState(() {
                            colour_id = item.color_id.toString();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(item.color_name ?? ""),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        colour_name = newValue.toString();
                      });
                    },
                    value: colour_name,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "BOOKING DATE :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: booking_date,
                keyboardType: TextInputType.datetime,
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
                    "VECHICLE STATUS:",
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
                    items: vehicleStatus.data?.map((item) {
                      return DropdownMenuItem(
                        value: item.vechicle_status,
                        onTap: () {
                          setState(() {
                            vehicle_id = item.id.toString();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(item.vechicle_status ?? ""),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        vehicle_status = newValue.toString();
                      });
                    },
                    value: vehicle_status,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "VEHICLE IDENTIFICATION NUMBER :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: vehicle_identification_num,
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
                    "MOTOR NUMBER :",
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
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  VehicleBookingSaveRepository()
                      .vehicleBookingSave(
                          widget.vehicleBookingDetails["id"].toString(),
                          customer_name.text,
                          dealer_id,
                          contact_no.text,
                          email.text,
                          vehicle_id,
                          battery_id,
                          colour_id,
                          booking_date.text,
                          vehicle_status_id,
                          model_id)
                      .then((value) {
                    if (value["success"] == 1) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VehicleBookingScreen()),
                      );
                    }
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
