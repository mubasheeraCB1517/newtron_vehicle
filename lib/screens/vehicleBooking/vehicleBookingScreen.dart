import 'package:flutter/material.dart';
import 'package:newtron_vehicle/module/blocs/vehicleBookingListBloc.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleBookingListModel.dart';
import 'package:newtron_vehicle/network/response.dart';

class VehicleBookingScreen extends StatefulWidget {
  const VehicleBookingScreen({Key? key}) : super(key: key);

  @override
  State<VehicleBookingScreen> createState() => _VehicleBookingScreenState();
}

class _VehicleBookingScreenState extends State<VehicleBookingScreen> {
  late VehicleBookingList vehicles;
  late VehicleBookingListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = VehicleBookingListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green[400]),
          centerTitle: true,
          backgroundColor: Colors.yellow[200],
          title: Text(
            "Vehicle Booking List",
            style: TextStyle(color: Colors.green[400]),
          ),
          elevation: 0,
        ),
        body: StreamBuilder<Response<VehicleBookingList>>(
            stream: _bloc.vehicleBookingListDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
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
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 30),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  width: MediaQuery.of(context).size.width,
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
                                                      .customer_name ??
                                                  "",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "${vehicles.data?[index].vechicle_name ?? ""}",
                                              style: TextStyle(
                                                  color: Colors.red[900]),
                                            ),
                                          ]),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      GestureDetector(
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
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                        ),
                                      ),
                                    ],
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
                  case Status.COMPLETED:
                    // TODO: Handle this case.
                    break;
                }
              }
              return Container(
                color: Colors.black45,
              );
            }));
  }
}
