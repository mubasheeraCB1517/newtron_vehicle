
import 'package:flutter/material.dart';
import 'package:newtron_vehicle/module/blocs/vehicleAllottedListBloc.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleAllotedListModel.dart';
import 'package:newtron_vehicle/module/repositotories/sparePartbookingEnquiryRepo.dart';
import 'package:newtron_vehicle/network/response.dart';
import 'package:newtron_vehicle/screens/vehicleBooking/vehicleAllottedMatchScreen.dart';
import '../../module/blocs/sparepartsBookingListBloc.dart';
import '../../module/modelClasses/sparepartsBookingLIstModel.dart';

class VehicleAllottedScreen extends StatefulWidget {
  const VehicleAllottedScreen({Key? key}) : super(key: key);

  @override
  State<VehicleAllottedScreen> createState() => _VehicleAllottedScreenState();
}

class _VehicleAllottedScreenState extends State<VehicleAllottedScreen> {

  late VehicleAllottedList vehicles;
  late VehicleAllottedListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc =  VehicleAllottedListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green[400]),
          centerTitle: true,
          backgroundColor: Colors.yellow[200],
          title: Text(
            "Vehicle Allotted List",
            style: TextStyle(color: Colors.green[400]),
          ),
          elevation: 0,
        ),
        body: StreamBuilder<Response<VehicleAllottedList>>(
            stream: _bloc.vehicleAllottedListDataStream,
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
                          margin: const EdgeInsets.only(top: 20,),
                          child: ListView.builder(
                              itemCount: vehicles.data?.length != null? vehicles.data?.length:0,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
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
                                      Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(vehicles.data?[index]
                                                .customer_name??
                                                "",style: const TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                                            Text(
                                              "${vehicles.data?[index]
                                                  .dealer_name ?? ""}",style:  TextStyle(fontSize: 15,color: Colors.red[900]),),
                                          ]),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>  VehicleAllottedMatchScreen(vehicle: vehicles.data?[index],id:vehicles.data![index].id.toString() ,)),
                                              );
                                         
                                        
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
                                                "Allotted Pending",
                                                style: TextStyle(
                                                    color: Colors.white),
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
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/error.png"),fit: BoxFit.contain,
                            )
                        )
                    );
                  case Status.COMPLETED:
                    break;
                }
              }
              return Container(
                color: Colors.black45,
              );
            }));
  }
}