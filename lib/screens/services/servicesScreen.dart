
import 'package:flutter/material.dart';
import 'package:newtron_vehicle/module/blocs/servicesListBloc.dart';
import 'package:newtron_vehicle/module/modelClasses/servicesList.dart';
import 'package:newtron_vehicle/module/repositotories/serviceEditRepository.dart';
import 'package:newtron_vehicle/network/response.dart';
import 'package:newtron_vehicle/screens/partsDetails/partsCreation.dart';
import 'package:newtron_vehicle/screens/services/servicesCreation.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  late ServicesList services;
  late ServicesListBloc _bloc;


  @override
  void initState() {
    super.initState();
    _bloc = ServicesListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green[400]),
          centerTitle: true,
          backgroundColor: Colors.yellow[200],
          title: Text(
            "Services List",
            style: TextStyle(color: Colors.green[400]),
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ServiceCreation()));
                },
                icon: const Icon(Icons.add))
          ],

        ),
        body: StreamBuilder<Response<ServicesList>>(
            stream: _bloc.serviceListDataStream,
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
                    services = snapshot.data!.data;
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: ListView.builder(
                              itemCount: services.data?.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    ServicesEditRepository()
                                        .servicesEdit(services.data![index].service_id
                                        .toString())
                                        .then((value) {
                                      if (value["success"] == 1) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ServiceCreation(
                                                    ServiceDetails: value["data"],
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
                                                services.data?[index].customer_name ?? "",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              Text(
                                                "${services.data?[index].service_status ?? ""}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red[900]!),
                                              ),
                                            ]),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {

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
                            fit: BoxFit.contain,
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
