import 'package:flutter/material.dart';

class VehicleCreation extends StatefulWidget {
  const VehicleCreation({Key? key}) : super(key: key);

  @override
  State<VehicleCreation> createState() => _VehicleCreationState();
}

class _VehicleCreationState extends State<VehicleCreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green[400]),
        centerTitle: true,
        backgroundColor: Colors.yellow[200],
        title: Text(
          "Vehicle Save",
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
              margin:const EdgeInsets.symmetric(vertical: 10),
                child:const Text(
              "Name:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
            TextFormField(
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
                margin:const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  "Amount:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.green[400]!,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40,),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(15.0),
                ),

                margin: const EdgeInsets.symmetric(horizontal: 100),
                child: const Center(
                  child: Text("Submit",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
