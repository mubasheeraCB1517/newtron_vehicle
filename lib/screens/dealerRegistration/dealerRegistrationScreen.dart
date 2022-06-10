import 'package:flutter/material.dart';
import 'package:newtron_vehicle/module/repositotories/dealerDeletionRepo.dart';
import 'package:newtron_vehicle/network/response.dart';

import '../../module/blocs/dealerListBloc.dart';
import '../../module/modelClasses/dealerListModel.dart';
import 'dealerRegistrationCreation.dart';

class DealerScreen extends StatefulWidget {
  const DealerScreen({Key? key}) : super(key: key);

  @override
  State<DealerScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<DealerScreen> {
  late DealerList dealer;
  late DealerListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = DealerListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green[400]),
          centerTitle: true,
          backgroundColor: Colors.yellow[200],
          title: Text(
            "Dealer List",
            style: TextStyle(color: Colors.green[400]),
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DealerCreation()));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: StreamBuilder<Response<DealerList>>(
            stream: _bloc.dealerListDataStream,
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
                    dealer = snapshot.data!.data;
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                          child: ListView.builder(
                              itemCount: dealer.data?.length,
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
                                              dealer.data?[index].dealer_name ??
                                                  "",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),

                                            Text(
                                              "${dealer.data?[index].contact_no ?? ""}",
                                              style:TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.red[900]),
                                            ),
                                          ]),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          DealerDeleteRepository().dealerDelete(dealer.data![index].id.toString()).then((value) {
                                            if(value["success"] == 1){
                                              Navigator.of(context).pop();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>  const DealerScreen()),
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
