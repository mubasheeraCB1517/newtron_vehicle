import 'package:flutter/material.dart';
import 'package:newtron_vehicle/network/response.dart';

import '../../module/blocs/sparepartsBookingListBloc.dart';
import '../../module/modelClasses/sparepartsBookingLIstModel.dart';





class SparePartsBookingScreen extends StatefulWidget {
  const SparePartsBookingScreen({Key? key}) : super(key: key);

  @override
  State<SparePartsBookingScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<SparePartsBookingScreen> {
  late SparePartsBookingList spareparts;
  late SparePartsBookingListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc =  SparePartsBookingListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green[400]),
          centerTitle: true,
          backgroundColor: Colors.yellow[200],
          title: Text(
            "SparePartsBooking List",
            style: TextStyle(color: Colors.green[400]),
          ),
          elevation: 0,
        ),
        body: StreamBuilder<Response<SparePartsBookingList>>(
            stream: _bloc.sparespartsBookingListDataStream,
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
                    spareparts = snapshot.data!.data;
                    return Stack(
                      children: [

                        Positioned(
                            left: 320,
                            top: 5,
                            child:  TextButton(onPressed: (){}, child: const Text("Add",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),))),
                        Container(
                          margin: const EdgeInsets.only(top: 40,),
                          // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                          child: ListView.builder(
                              itemCount: spareparts.data?.length,
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
                                            Text(spareparts.data?[index]
                                                .customer_name??
                                                "",style: const TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                                            const SizedBox(height: 10,),
                                            Text(
                                              "${spareparts.data?[index]
                                                  .vechicle_name ?? ""}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red),),
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