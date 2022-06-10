import 'package:flutter/material.dart';
import 'package:newtron_vehicle/module/repositotories/sparePartsDeletionRepo.dart';
import 'package:newtron_vehicle/network/response.dart';
import 'package:newtron_vehicle/screens/sparepartsDetails/sparepartsCreation.dart';

import '../../module/blocs/sparepartsListBloc.dart';
import '../../module/modelClasses/sparepartsListModel.dart';
import '../../module/repositotories/sparepartsEditRepo.dart';

class SparePartsScreen extends StatefulWidget {
  const SparePartsScreen({Key? key}) : super(key: key);

  @override
  State<SparePartsScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<SparePartsScreen> {
  late SparePartsList spare;
  late SparePartsListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SparePartsListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green[400]),
          centerTitle: true,
          backgroundColor: Colors.yellow[200],
          title: Text(
            "SpareParts List",
            style: TextStyle(color: Colors.green[400]),
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SparePartsCreation()));
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: StreamBuilder<Response<SparePartsList>>(
            stream: _bloc.sparesListDataStream,
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
                    spare = snapshot.data!.data;

                    return Stack(
                      children: [

                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                          child: ListView.builder(
                              itemCount: spare.data?.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    SparePartsEditRepository().sparepartsEdit(spare.data![index].spare_id.toString()).then((value) {
                                      if(value["success"] == 1){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>  SparePartsCreation(spareDetails: value["data"],)),
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
                                                spare.data?[index]
                                                        .vechicle_name ??
                                                    "",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold),
                                              ),

                                              Text(
                                                "${spare.data?[index].customer_name ?? ""}",
                                                style:  TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red[900]),
                                              ),
                                            ]),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            SparePartsDeleteRepository().sparePartsDelete(spare.data![index].spare_id.toString()).then((value) {
                                              if(value["success"] == 1){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>  SparePartsScreen()),
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
                                              style:
                                                  TextStyle(color: Colors.white),
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
                              image: AssetImage("assest/images/error.png"),fit: BoxFit.fill,
                          )
                      ),
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
