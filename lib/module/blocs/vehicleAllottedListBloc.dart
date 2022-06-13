
import 'dart:async';

import 'package:newtron_vehicle/module/modelClasses/vehicleAllotedListModel.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleAllottedListRepo.dart';
import 'package:newtron_vehicle/network/response.dart';



class VehicleAllottedListBloc{
  VehicleAllottedListRepository  _vehicleAllottedListrepository = new VehicleAllottedListRepository ();
  final _vehicleAllottedListDataController= StreamController<Response<VehicleAllottedList>>();

  StreamSink<Response<VehicleAllottedList>> get vehicleAllottedListDataSink =>
      _vehicleAllottedListDataController.sink;

  Stream<Response<VehicleAllottedList>>? get vehicleAllottedListDataStream =>
      _vehicleAllottedListDataController.stream;

  VehicleAllottedListBloc() {
    _vehicleAllottedListrepository  = VehicleAllottedListRepository ();
    getVehicleAllottedListBloc();
  }

  getVehicleAllottedListBloc() async {
    vehicleAllottedListDataSink.add(Response.loading('Fetching...'));
    try {
      VehicleAllottedList _vehicleAllottedList = await _vehicleAllottedListrepository.vehicelAllottedList();
      vehicleAllottedListDataSink.add(Response.success(_vehicleAllottedList));
    } catch (e) {
      vehicleAllottedListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _vehicleAllottedListDataController.close();
  }
}