import 'package:flutter/material.dart';
import 'package:newtron_vehicle/module/repositotories/colorEditRepo.dart';
import 'package:newtron_vehicle/network/response.dart';
import 'package:newtron_vehicle/screens/colourDetails/colourCreation.dart';

import '../../module/blocs/customerListBloc.dart';
import '../../module/modelClasses/customerListModel.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _ColourScreenState();
}

class _ColourScreenState extends State<CustomerScreen> {
  late CustomerList customer;
  late CustomerListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CustomerListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green[400]),
          centerTitle: true,
          backgroundColor: Colors.yellow[200],
          title: Text(
            "Customer List",
            style: TextStyle(color: Colors.green[400]),
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const ColourCreation()),
                  // );
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: StreamBuilder<Response<CustomerList>>(
            stream: _bloc.customerListDataStream,
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
                    customer = snapshot.data!.data;
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: ListView.builder(
                              itemCount:   customer.data?.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    ColorEditRepository().colorEdit( customer.data![index].color_id.toString()).then((value) {
                                      if(value["success"] == 1){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>  ColourCreation(colorDetails: value["data"],)),
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
                                                customer.data?[index].customer_name??
                                                    "",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold),
                                              ),SizedBox(height: 5,),
                                              Text(
                                                "${ customer.data?[index].vechicle_name ?? ""}",
                                                style:  TextStyle(fontSize: 18,color: Colors.red[900]
                                                    ),
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
