import 'package:flutter/material.dart';
import '../../module/modelClasses/stateListModel.dart';
import '../../module/repositotories/dealerCreationRepo.dart';
import '../../module/repositotories/stateListRepo.dart';
import 'dealerRegistrationScreen.dart';

class DealerCreation extends StatefulWidget {
  const DealerCreation({Key? key, this.dealerDetails}) : super(key: key);
  final dealerDetails;

  @override
  State<DealerCreation> createState() => _ColourCreationState();
}

class _ColourCreationState extends State<DealerCreation> {
  final dealer_name = TextEditingController();
  final address = TextEditingController();
  final contact_no = TextEditingController();
  final email = TextEditingController();
  final gst_in = TextEditingController();
  final place = TextEditingController();
  final password = TextEditingController();

  StateList _stateList = StateList();
  String state_name = "";
  String state_id = "";
  String id="";

  @override
  void initState() {
    super.initState();
    StateListRepository().stateList().then((value) {
      setState(() {
        _stateList = value;
        state_name = value.data[0].state_name;
        state_id = value.data[0].state_id.toString();
        if (widget.dealerDetails != null) {
          int index = value.data?.indexWhere(
              (item) => item.state_name == widget.dealerDetails["state_name"]);
          state_name = value.data?[index].state_name;
          state_id = value.data![index].state_id.toString();
        }
      });
    });
    if (widget.dealerDetails != null) {
      dealer_name.text = widget.dealerDetails['dealer_name'].toString();
      address.text = widget.dealerDetails['address'].toString();
      contact_no.text = widget.dealerDetails['contact_no'].toString();
      email.text = widget.dealerDetails['email'].toString();
      gst_in.text = widget.dealerDetails['gst_in'].toString();
      place.text = widget.dealerDetails['place'].toString();
      // password.text =widget.dealerDetails['password'].toString();
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
          "Dealer ADD",
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
                    "DEALER NAME :",
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
                    "ADDRESS :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: address,
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
                    "CONTACT NUMBER :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: contact_no,
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
                    "E-MAIL:",
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
                    "GST_IN :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: gst_in,
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
                    "STATE:",
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
                    items: _stateList.data?.map((item) {
                      return DropdownMenuItem(
                        value: item.state_name,
                        onTap: () {
                          setState(() {
                            state_id = item.state_id.toString();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(item.state_name ?? ""),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        state_name = newValue.toString();
                      });
                    },
                    value: state_name,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "PLACE :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              TextFormField(
                controller: place,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.green[400]!,
                    ),
                  ),
                ),
              ),
              widget.dealerDetails == null? Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "Password :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )):SizedBox(height: 0,),
              widget.dealerDetails == null? TextFormField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.green[400]!,
                    ),
                  ),
                ),
              ):SizedBox(height: 0,),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(

                onTap: () {

                  print("123==${state_id}");
                  dealer_name.text.isEmpty == true &&
                      address.text.isEmpty == true &&
                      contact_no.text.isEmpty == true &&
                      email.text.isEmpty == true &&
                      gst_in.text.isEmpty == true &&
                      state_id == true &&
                      place.text.isEmpty == true&&
                  password.text.isEmpty == true;
                  DealerCreationRepository()
                      .dealerCreation(
                    dealer_name.text,
                    address.text,
                    contact_no.text,
                    email.text,
                    gst_in.text,
                    state_id,
                    place.text,
                    password.text,
                      widget.dealerDetails != null? widget.dealerDetails["id"].toString():"0"
                  )
                      .then((value) {
                    if (value["success"] == 1) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DealerScreen()),
                      );

                    }
                    else {}
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
