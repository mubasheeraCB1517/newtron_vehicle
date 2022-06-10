import 'package:flutter/material.dart';
import 'package:newtron_vehicle/module/blocs/colourListBloc.dart';
import 'package:newtron_vehicle/module/modelClasses/colourListModel.dart';
import 'package:newtron_vehicle/module/repositotories/colorDeleteRepo.dart';
import 'package:newtron_vehicle/module/repositotories/colorEditRepo.dart';
import 'package:newtron_vehicle/network/response.dart';
import 'package:newtron_vehicle/screens/colourDetails/colourCreation.dart';

class ColourScreen extends StatefulWidget {
  const ColourScreen({Key? key}) : super(key: key);

  @override
  State<ColourScreen> createState() => _ColourScreenState();
}

class _ColourScreenState extends State<ColourScreen> {
  late ColourList colours;
  late ColourListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ColourListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.green[400]),
          centerTitle: true,
          backgroundColor: Colors.yellow[200],
          title: Text(
            "Colour List",
            style: TextStyle(color: Colors.green[400]),
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ColourCreation()),
                  );
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: StreamBuilder<Response<ColourList>>(
            stream: _bloc.colourListDataStream,
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
                    colours = snapshot.data!.data;
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: ListView.builder(
                              itemCount: colours.data?.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    ColorEditRepository().colorEdit(colours.data![index].color_id.toString()).then((value) {
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
                                                colours.data?[index].color_name ??
                                                    "",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                "₹${colours.data?[index].dealer_price ?? ""}",
                                                style: TextStyle(
                                                    color: Colors.red[900]),
                                              ),
                                            ]),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            ColorDeleteRepository().colorDelete(colours.data![index].color_id.toString()).then((value) {
                                              if(value["success"] == 1){
                                                Navigator.of(context).pop();
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>  ColourScreen()),
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
