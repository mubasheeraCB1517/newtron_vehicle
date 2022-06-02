import 'package:flutter/material.dart';
import 'package:newtron_vehicle/module/blocs/vehicleListBloc.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleListModel.dart';
import 'package:newtron_vehicle/network/response.dart';

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
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "Vehicle List",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: StreamBuilder<Response<VehicleList>>(
            stream: _bloc.vehicleListDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.green[400],
                        ),
                      ),
                    ); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                    break;
                  case Status.SUCCESS:
                    vehicles = snapshot.data!.data;
                    return Container(
                      child: Stack(
                        children: [

                          Container(
                            margin: const EdgeInsets.only(top: 40, bottom: 130),
                            // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                            child: ListView.builder(
                                itemCount: vehicles.data?.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: const Offset(1,
                                                1), // changes position of shadow
                                          ),
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [

                                        // Image.asset("assets/images/profile.jpeg",fit: BoxFit.fill,)),

                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(vehicles.data?[index]
                                                  .vechicle_name ??
                                                  ""),
                                              Text(
                                                  "₹${vehicles.data?[index]
                                                      .amount ?? ""}"),
                                            ]),
                                        const SizedBox(
                                          width: 10,
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
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),

                        ],
                      ),
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