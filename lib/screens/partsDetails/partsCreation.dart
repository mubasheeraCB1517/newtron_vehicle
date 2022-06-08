import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newtron_vehicle/screens/partsDetails/partsScreen.dart';
import '../../module/repositotories/partsCreationRepo.dart';
import '../alertBox/alertBox.dart';

class PartsCreation extends StatefulWidget {
  const PartsCreation({Key? key,this.partsDetails}) : super(key: key);
 final partsDetails;
  @override
  State<PartsCreation> createState() => _ColourCreationState();
}

class _ColourCreationState extends State<PartsCreation> {
  // ignore: non_constant_identifier_names
  final parts_name = TextEditingController();
  final specification = TextEditingController();
  final price = TextEditingController();

  // ignore: non_constant_identifier_names
  final dealer_price = TextEditingController();
  @override
  void initState() {
    super.initState();
    if(widget.partsDetails != null){
      parts_name .text = widget.partsDetails["parts_name"];
      specification.text = widget.partsDetails["specification"];
      price.text = widget.partsDetails["price"];
      dealer_price.text = widget.partsDetails["dealer_price"];
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
          "Parts",

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

                  "Parts Name:",

                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            TextFormField(
              controller: parts_name,
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
                parts_name.text.isEmpty == true &&
                    specification.text.isEmpty == true &&
                    price.text.isEmpty == true &&
                    dealer_price.text.isEmpty == true
                ?PartsCreationRepository()
                    .partsCreation(parts_name.text, specification.text,
                        price.text, dealer_price.text,widget.partsDetails !=null ? widget.partsDetails["parts_id"].toString():"0")
                    .then((value) {
                  if (value["success"] == 1) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PartsScreen()),
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
