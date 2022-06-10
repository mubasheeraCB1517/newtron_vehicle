import 'package:flutter/material.dart';
import 'package:newtron_vehicle/module/blocs/vehicleListBloc.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleListModel.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleDeletionRepo.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleEditRepo.dart';
import 'package:newtron_vehicle/network/response.dart';
import 'package:newtron_vehicle/screens/vehicleDetails/vehicleCreation.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({Key? key}) : super(key: key);

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  late VehicleList vehicles;
  late VehicleListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = VehicleListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green[400]),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const VehicleCreation()),
              );
            }, icon: Icon(Icons.add))
          ],
          backgroundColor: Colors.yellow[200],
          title: Text(
            "Vehicle List",
            style: TextStyle(color: Colors.green[400]),
          ),
          elevation: 0,
        ),
        body: StreamBuilder<Response<VehicleList>>(
            stream: _bloc.vehicleListDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // ignore: missing_enum_constant_in_switch
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.green[400],
                      ),
                    );

                  case Status.SUCCESS:
                    vehicles = snapshot.data!.data;
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: ListView.builder(
                              itemCount: vehicles.data?.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    VehicleEditRepository().vehicleEdit(vehicles.data![index].vechicle_id.toString()).then((value) {
                                      if(value["success"] == 1){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>  VehicleCreation(vehicleDetails: value["data"],)),
                                        );
                                      }
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 30),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: const Offset(1,
                                                1), // changes position of shadow
                                          ),
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                vehicles.data?[index]
                                                    .vechicle_name ??
                                                    "",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                "₹${vehicles.data?[index]
                                                    .amount ?? ""}",
                                                style: TextStyle(
                                                    color: Colors.red[900]),
                                              ),
                                            ]),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            VehicleDeleteRepository().vehicleDelete(vehicles.data![index].vechicle_id.toString()).then((value) {
                                              if(value["success"] == 1){
                                                Navigator.of(context).pop();
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>  VehicleScreen()),
                                                );
                                              }
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 5),
                                            decoration: BoxDecoration(
                                                color: Colors.green[400],
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            child: const Center(
                                                child: Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  case Status.ERROR:
                    return Container(
                      color: Colors.yellow,
                    );
                }
              }
              return Container(
                color: Colors.black45,
              );
            }));
  }
}
