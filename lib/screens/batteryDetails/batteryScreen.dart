import 'package:flutter/material.dart';
import 'package:newtron_vehicle/network/response.dart';

import '../../module/blocs/batteryListBloc.dart';
import '../../module/modelClasses/batteryListModel.dart';

class BatteryScreen extends StatefulWidget {
  const BatteryScreen({Key? key}) : super(key: key);

  @override
  State<BatteryScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  late BatteryList battery;
  late BatteryListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc =  BatteryListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green[400]),
          centerTitle: true,
          backgroundColor: Colors.yellow[200],
          title: Text(
            "Battery List",
            style: TextStyle(color: Colors.green[400]),
          ),
          elevation: 0,
        ),
        body: StreamBuilder<Response<BatteryList>>(
            stream: _bloc.batteryListDataStream,
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
                    battery = snapshot.data!.data;
                    return Container(

                      child: Stack(
                        children: [

                          Positioned(
                            left: 320,
                                  top: 5,
                              child:  TextButton(onPressed: (){}, child: Text("Add",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),))),


                          Container(
                            margin: const EdgeInsets.only(top: 40, bottom: 130),
                            // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                            child: ListView.builder(
                                itemCount: battery.data?.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
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
                                              Text(battery.data?[index]
                                                  .battery ??
                                                  "",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                                              SizedBox(height: 10,),
                                              Text(
                                                  "₹${battery.data?[index]
                                                      .dealer_price ?? ""}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red),),
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