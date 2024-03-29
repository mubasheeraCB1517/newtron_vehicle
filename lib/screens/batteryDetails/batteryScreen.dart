import 'package:flutter/material.dart';
import 'package:newtron_vehicle/network/response.dart';
import '../../module/blocs/batteryListBloc.dart';
import '../../module/modelClasses/batteryListModel.dart';
import '../../module/repositotories/batteryDeleteRepo.dart';
import '../../module/repositotories/batteryEditRepo.dart';
import 'batteryCreation.dart';

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
    _bloc = BatteryListBloc();
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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BatteryCreation()));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: StreamBuilder<Response<BatteryList>>(
            stream: _bloc.batteryListDataStream,
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
                    battery = snapshot.data!.data;
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: ListView.builder(
                              itemCount: battery.data?.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    BatteryEditRepository()
                                        .batteryEdit(battery
                                            .data![index].battery_id
                                            .toString())
                                        .then((value) {
                                      if (value["success"] == 1) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BatteryCreation(
                                                    batteryDetails:
                                                        value["data"],
                                                  )),
                                        );
                                      }
                                    });
                                  },
                                  child: Container(
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
                                              Text(
                                                battery.data?[index].battery ??
                                                    "",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "₹${battery.data?[index].dealer_price ?? ""}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red[900]),
                                              ),
                                            ]),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            BatteryDeleteRepository()
                                                .batterydelete(battery
                                                    .data![index].battery_id
                                                    .toString())
                                                .then((value) {
                                              if (value["success"] == 1) {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const BatteryScreen()),
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
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/error.png"),
                        fit: BoxFit.fill,
                      )),
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
