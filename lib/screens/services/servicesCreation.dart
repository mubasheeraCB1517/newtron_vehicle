import 'package:flutter/material.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleListModel.dart';
import 'package:newtron_vehicle/module/repositotories/serviceAddRepository.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleListRepo.dart';
import 'package:newtron_vehicle/screens/services/servicesScreen.dart';

class ServiceCreation extends StatefulWidget {
  const ServiceCreation({Key? key, this.ServiceDetails}) : super(key: key);
  final ServiceDetails;

  @override
  State<ServiceCreation> createState() => _ServiceCreationState();
}

class _ServiceCreationState extends State<ServiceCreation>
    {
  String firstService_vehicle_name = "";
  String firstService_vehicle_id = "";
  final firstServiceidentificationNumber = TextEditingController();
  final firstServicecustomerName = TextEditingController();
  final firstServicecontactNumber = TextEditingController();
  final firstServiceDate = TextEditingController();
  VehicleList firstService_vehicleList = VehicleList();
  String secondService_vehicle_name = "";
  String secondService_vehicle_id = "";
  final secondServiceidentificationNumber = TextEditingController();
  final secondServicecustomerName = TextEditingController();
  final secondServicecontactNumber = TextEditingController();
  final secondServiceDate = TextEditingController();
  VehicleList secondService_vehicleList = VehicleList();
  String thirdService_vehicle_name = "";
  String thirdService_vehicle_id = "";
  final thirdServiceidentificationNumber = TextEditingController();
  final thirdServicecustomerName = TextEditingController();
  final thirdServicecontactNumber = TextEditingController();
  final thirdServiceDate = TextEditingController();
  VehicleList thirdService_vehicleList = VehicleList();


  @override
  void initState() {
    super.initState();
    VehicleListRepository().vehicleList().then((value) {
      setState(() {
        firstService_vehicleList = value;
        firstService_vehicle_name = value.data[0].vechicle_name;
        firstService_vehicle_id = value.data[0].vechicle_id.toString();
        secondService_vehicleList = value;
        secondService_vehicle_name = value.data[0].vechicle_name;
        secondService_vehicle_id = value.data[0].vechicle_id.toString();
        thirdService_vehicleList = value;
        thirdService_vehicle_name = value.data[0].vechicle_name;
        thirdService_vehicle_id = value.data[0].vechicle_id.toString();
        if (widget.ServiceDetails != null) {
          int index = value.data!.indexWhere((item) =>
          item.vechicle_id.toString() ==
              widget.ServiceDetails["vechicle_name"].toString());
          firstService_vehicle_name = value.data?[index].vechicle_name;
          firstService_vehicle_id = value.data![index].vechicle_id.toString();
          firstServiceidentificationNumber.text =
          widget.ServiceDetails["vechicle_identification_num"];
          firstServicecustomerName.text =
          widget.ServiceDetails["customer_name"];
          firstServicecontactNumber.text = widget.ServiceDetails["customer_no"];
          firstServiceDate.text = widget.ServiceDetails["services"];
          secondService_vehicle_name = value.data?[index].vechicle_name;
          secondService_vehicle_id = value.data![index].vechicle_id.toString();
          secondServiceidentificationNumber.text =
          widget.ServiceDetails["vechicle_identification_num"];
          secondServicecustomerName.text =
          widget.ServiceDetails["customer_name"];
          secondServicecontactNumber.text =
          widget.ServiceDetails["customer_no"];
          secondServiceDate.text = widget.ServiceDetails["services"];
          thirdService_vehicle_name = value.data?[index].vechicle_name;
          thirdService_vehicle_id = value.data![index].vechicle_id.toString();
          thirdServiceidentificationNumber.text =
          widget.ServiceDetails["vechicle_identification_num"];
          thirdServicecustomerName.text =
          widget.ServiceDetails["customer_name"];
          thirdServicecontactNumber.text = widget.ServiceDetails["customer_no"];
          thirdServiceDate.text = widget.ServiceDetails["services"];
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green[400]),
          centerTitle: true,
          backgroundColor: Colors.yellow[200],
          title: Text(
            "Services Edit",
            style: TextStyle(color: Colors.green[400]),
          ),
          elevation: 0,
          bottom: TabBar(
            indicatorColor: Colors.green[400],
            tabs: [
              Text("Service 1",
                style: TextStyle(color: Colors.green[400], fontSize: 15),),
              Text("Service 2",
                  style: TextStyle(color: Colors.green[400], fontSize: 15)),
              Text("Service 3",
                  style: TextStyle(color: Colors.green[400], fontSize: 15)),
            ],),
        ),
        body: TabBarView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Identification Number:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  TextFormField(
                    controller: firstServiceidentificationNumber,
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(color: Colors.grey)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: firstService_vehicleList.data?.map((item) {
                          return DropdownMenuItem(
                            value: item.vechicle_name,
                            onTap: () {
                              setState(() {
                                firstService_vehicle_id =
                                    item.vechicle_id.toString();
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10),
                              child: Text(item.vechicle_name ?? ""),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            firstService_vehicle_name = newValue.toString();
                          });
                        },
                        value: firstService_vehicle_name,
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Customer Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  TextFormField(
                    controller: firstServicecustomerName,
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
                        "Contact Number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  TextFormField(
                    controller: firstServicecontactNumber,
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
                        "First Service Date:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  TextFormField(
                    controller: firstServiceDate,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.green[400]!,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        ServicesAddRepository().servicesAdd(
                            widget.ServiceDetails != null?   widget.ServiceDetails["service_id"].toString() :"0",
                            "1",
                            firstServiceDate.text,
                            firstServiceidentificationNumber.text,
                            firstService_vehicle_id,
                            firstServicecontactNumber.text,
                            "SERVICE 1",
                            firstServicecustomerName.text).then((value) {
                              if(value["success"] == 1){
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ServicesScreen()),
                                );
                              }
                        });
                      },
                      child: Container(
                        //margin: EdgeInsets.symmetric(horizontal: 150),
                        padding: EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        color: Colors.green[400]!,
                        child: Text("Apply Now", style: TextStyle(color: Colors
                            .white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Identification Number:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  TextFormField(
                    controller: secondServiceidentificationNumber,
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(color: Colors.grey)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: secondService_vehicleList.data?.map((item) {
                          return DropdownMenuItem(
                            value: item.vechicle_name,
                            onTap: () {
                              setState(() {
                                secondService_vehicle_id =
                                    item.vechicle_id.toString();
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10),
                              child: Text(item.vechicle_name ?? ""),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            secondService_vehicle_name = newValue.toString();
                          });
                        },
                        value: secondService_vehicle_name,
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Customer Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  TextFormField(
                    controller: secondServicecustomerName,
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
                        "Contact Number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  TextFormField(
                    controller: secondServicecontactNumber,
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
                        "Second Service Date:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  TextFormField(
                    controller: secondServiceDate,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.green[400]!,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        ServicesAddRepository().servicesAdd(
                            widget.ServiceDetails != null?   widget.ServiceDetails["service_id"].toString() :"0",
                            "2",
                            secondServiceDate.text,
                            secondServiceidentificationNumber.text,
                            secondService_vehicle_id,
                            secondServicecontactNumber.text,
                            "SERVICE 2",
                            secondServicecustomerName.text).then((value) {
                          if(value["success"] == 1){
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServicesScreen()),
                            );
                          }
                        });
                      },
                      child: Container(
                        //margin: EdgeInsets.symmetric(horizontal: 150),
                        padding: EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        color: Colors.green[400]!,
                        child: Text("Apply Now", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Identification Number:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  TextFormField(
                    controller: thirdServiceidentificationNumber,
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(color: Colors.grey)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: thirdService_vehicleList.data?.map((item) {
                          return DropdownMenuItem(
                            value: item.vechicle_name,
                            onTap: () {
                              setState(() {
                                thirdService_vehicle_id =
                                    item.vechicle_id.toString();
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10),
                              child: Text(item.vechicle_name ?? ""),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            thirdService_vehicle_name = newValue.toString();
                          });
                        },
                        value: thirdService_vehicle_name,
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Customer Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  TextFormField(
                    controller: thirdServicecustomerName,
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
                        "Contact Number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  TextFormField(
                    controller: thirdServicecontactNumber,
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
                        "Third Service Date:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  TextFormField(
                    controller: thirdServiceDate,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.green[400]!,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        ServicesAddRepository().servicesAdd(
                            widget.ServiceDetails != null?   widget.ServiceDetails["service_id"].toString() :"0",
                            "3",
                            thirdServiceDate.text,
                            thirdServiceidentificationNumber.text,
                            thirdService_vehicle_id,
                            thirdServicecontactNumber.text,
                            "SERVICE 3",
                            thirdServicecustomerName.text).then((value) {
                          if(value["success"] == 1){
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServicesScreen()),
                            );
                          }
                        });
                      },
                      child: Container(
                        //margin: EdgeInsets.symmetric(horizontal: 150),
                        padding: EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        color: Colors.green[400]!,
                        child: Text("Apply Now", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
