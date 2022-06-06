import 'package:flutter/material.dart';
import 'package:newtron_vehicle/network/response.dart';
import 'package:newtron_vehicle/screens/warrantyDeatils/warrantyCreation.dart';

import '../../module/blocs/warrantyListBloc.dart';
import '../../module/modelClasses/warrantyListModel.dart';

class WarrantyScreen extends StatefulWidget {
  const WarrantyScreen({Key? key}) : super(key: key);

  @override
  State<WarrantyScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<WarrantyScreen> {
  late WarrantyList Warranty;
  late WarrantyListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = WarrantyListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green[400]),
          centerTitle: true,
          backgroundColor: Colors.yellow[200],
          title: Text(
            "Warranty Request",
            style: TextStyle(color: Colors.green[400]),
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WarrantyCreation()),
                  );
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: StreamBuilder<Response<WarrantyList>>(
            stream: _bloc.warrantyListDataStream,
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
                    Warranty = snapshot.data!.data;
                    return Stack(
                      children: [

                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: ListView.builder(
                              itemCount: Warranty.data?.length,
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
                                              Warranty.data?[index]
                                                      .dealer_name ??
                                                  "",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${Warranty.data?[index].vechicle_name ?? ""}",
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
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
