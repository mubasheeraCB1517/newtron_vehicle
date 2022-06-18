import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleListModel.dart';
import 'package:newtron_vehicle/module/repositotories/customerGetRepo.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/warrantyCreationRepo.dart';
import 'package:newtron_vehicle/screens/alertBox/alertBox.dart';
import 'package:newtron_vehicle/screens/warrantyDeatils/warrantyDeatilsScreen.dart';

class WarrantyCreation extends StatefulWidget {
  const WarrantyCreation({Key? key, this.warrentyDetails}) : super(key: key);
  final warrentyDetails;

  @override
  State<WarrantyCreation> createState() => _WarrantyCreationState();
}

class _WarrantyCreationState extends State<WarrantyCreation> {
  // ignore: non_constant_identifier_names
  final identification_number = TextEditingController();

  // ignore: non_constant_identifier_names
  final claim_date = TextEditingController();

  // ignore: non_constant_identifier_names
  final customer_name = TextEditingController();

  // ignore: non_constant_identifier_names
  final customer_number = TextEditingController();

  // ignore: non_constant_identifier_names
  final customer_email = TextEditingController();

  // ignore: non_constant_identifier_names
  final dealer_name = TextEditingController();

  // ignore: non_constant_identifier_names
  final dealer_number = TextEditingController();

  // ignore: non_constant_identifier_names
  final dealer_email = TextEditingController();

  // ignore: non_constant_identifier_names
  final comment_box = TextEditingController();

  // ignore: non_constant_identifier_names
  VehicleList _vehicleList = VehicleList();
  String vehicleName = "";
  String vehicleId = "";
  List cusDealer = ["Dealer", "Customer"];
  String cd = "Dealer";

  @override
  void initState() {
    super.initState();
    VehicleListRepository().vehicleList().then((value) {
      setState(() {
        _vehicleList = value;
        vehicleName = value.data[0].vechicle_name;
        vehicleId = value.data[0].vechicle_id.toString();
        if (widget.warrentyDetails != null) {
          int index = value.data?.indexWhere((item) =>
              item.vechicle_name == widget.warrentyDetails["vechicle_name"]);
          vehicleName = value.data?[index].vechicle_name;
          vehicleId = value.data![index].vechicle_id.toString();
          print("vehicleId==${index}");
          identification_number.text =
              widget.warrentyDetails["vechicle_identification_num"];
          claim_date.text = widget.warrentyDetails["claim_date"];
          customer_name.text = widget.warrentyDetails["customer_name"];
          customer_number.text = widget.warrentyDetails["customer_no"];
          customer_email.text = widget.warrentyDetails["customer_email"];
          dealer_name.text = widget.warrentyDetails["dealer_name"];
          dealer_number.text = widget.warrentyDetails["dealer_no"];
          dealer_email.text = widget.warrentyDetails["dealer_email"];
          comment_box.text = widget.warrentyDetails["complaint"];
        }
        if (widget.warrentyDetails != null) {
          int index = cusDealer
              .indexWhere((item) => item == widget.warrentyDetails["cd"]);
          cd = cusDealer[index];
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
          "Warranty request",
          style: TextStyle(color: Colors.green[400]),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "Vehicle Name:",
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
                    "Are you a Dealer or Customer?",
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
                    items: cusDealer.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        onTap: () {
                          setState(() {
                            cd = item;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(item ?? ""),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        cd = newValue.toString();
                      });
                    },
                    value: cd,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "Identification Number:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                onChanged: (String value){
                  CustomerGetRepository().customerGet(vehicleId.toString(), value).then((value) {
                    setState(()
                    {
                      customer_name.text = value.data.customer_name;
                      dealer_name.text = value.data.dealer_name;
                      customer_email.text = value.data.customer_email;
                      customer_number.text = value.data.customer_no;
                    }
                    );

                  });
                },
                controller: identification_number,
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
                    "Claim Date:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: claim_date,
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
                    "Customer Details:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.green,
                        color: Colors.green),
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "Customer Name:",
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
                    "Customer Contact Number:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: customer_number,
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
                    "Customer Email:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: customer_email,
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
                    "Dealer Details:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.green,
                        color: Colors.green),
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "Dealer Name:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: dealer_name,
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
                    "Dealer Contact Number:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: dealer_number,
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
                    "Dealer Email:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: dealer_email,
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
                    "Comment Box:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: comment_box,
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
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  identification_number.text.isNotEmpty == true &&
                          claim_date.text.isNotEmpty == true &&
                          customer_email.text.isNotEmpty == true &&
                          customer_number.text.isNotEmpty == true &&
                          dealer_name.text.isNotEmpty == true &&
                          dealer_number.text.isNotEmpty == true &&
                          dealer_email.text.isNotEmpty == true &&
                          comment_box.text.isNotEmpty == true
                      ? WarrantyCreationRepository()
                          .warrantyCreation(
                              vehicleId,
                              cd,
                              identification_number.text,
                              claim_date.text,
                              customer_name.text,
                              customer_number.text,
                              customer_email.text,
                              dealer_name.text,
                              dealer_number.text,
                              dealer_email.text,
                              comment_box.text,
                              widget.warrentyDetails != null
                                  ? widget.warrentyDetails["id"].toString()
                                  : "0")
                          .then((value) {
                          if (value["success"] == 1) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WarrantyScreen()),
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
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
