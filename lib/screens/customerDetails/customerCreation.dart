import 'package:flutter/material.dart';
import '../../module/modelClasses/vehicleListModel.dart';
import '../../module/repositotories/customerCreationRepo.dart';
import '../../module/repositotories/vehicleListRepo.dart';
import 'customerScreen.dart';

class CustomerCreation extends StatefulWidget {
  const CustomerCreation({Key? key, this.customerDetails}) : super(key: key);
  final customerDetails;

  @override
  State<CustomerCreation> createState() => _ColourCreationState();
}

class _ColourCreationState extends State<CustomerCreation> {
  final Number = TextEditingController();
  final dealerName = TextEditingController();
  final customerName = TextEditingController();
  final contactNumber = TextEditingController();
  final email = TextEditingController();
  final motorNumber = TextEditingController();

  VehicleList _vehicleList = VehicleList();
  String vechicle_name = "";
  String vechicle_id = "";
  String id = "";

  @override
  void initState() {
    super.initState();
    VehicleListRepository().vehicleList().then((value) {
      setState(() {
        _vehicleList = value;
        vechicle_name = value.data[0].vechicle_name;
        vechicle_id = value.data[0].vechicle_id.toString();
        if (widget.customerDetails != null) {
          int index = value.data?.indexWhere((item) =>
              item.vechicle_name == widget.customerDetails["vechicle_name"]);
          vechicle_name = value.data?[index].vechicle_name;
          vechicle_id = value.data![index].vechicle_id.toString();
        }
      });
    });
    if (widget.customerDetails != null) {
      Number.text =
          widget.customerDetails['vechicle_identification_num'].toString();
      dealerName.text = widget.customerDetails['dealer_name'].toString();
      customerName.text = widget.customerDetails['customer_name'].toString();
      contactNumber.text = widget.customerDetails['customer_no'].toString();
      email.text = widget.customerDetails['customer_email'].toString();
      motorNumber.text = widget.customerDetails['motor_num'].toString();
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
          "Customer ADD",
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
                    "Identification Number :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: Number,
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
                    "Vechicle Name :",
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
                            vechicle_id = item.vechicle_id.toString();
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
                        vechicle_name = newValue.toString();
                      });
                    },
                    value: vechicle_name,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "Dealer Name :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: dealerName,
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
                    "Customer Name :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: customerName,
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
                    "Contact Number:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: contactNumber,
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
                    "E-mail:",
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
                    "Motor Number :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: motorNumber,
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
                height: 0,
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Number.text.isEmpty == true &&
                      dealerName.text.isEmpty == true &&
                      customerName.text.isEmpty == true &&
                      email.text.isEmpty == true &&
                      contactNumber.text.isEmpty == true &&
                      vechicle_id == true &&
                      motorNumber.text.isEmpty == true;
                  CustomerCreationRepository()
                      .customerCreation(
                          vechicle_id,
                          dealerName.text,
                          customerName.text,
                          contactNumber.text,
                          email.text,
                          Number.text,
                          motorNumber.text,
                          widget.customerDetails != null
                              ? widget.customerDetails["id"].toString()
                              : "0")
                      .then((value) {
                    if (value["success"] == 1) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomerScreen()),
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
