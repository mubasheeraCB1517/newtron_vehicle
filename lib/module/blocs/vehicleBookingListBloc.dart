
import 'dart:async';
import 'package:newtron_vehicle/module/modelClasses/colourListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleBookingListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleListModel.dart';
import 'package:newtron_vehicle/module/repositotories/colourListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleBookingListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleListRepo.dart';
import 'package:newtron_vehicle/network/response.dart';

class VehicleBookingListBloc{
  VehicleBookingListRepository  _vehicleBookingListRepository = new VehicleBookingListRepository ();
  final _vehicleBookingListDataController= StreamController<Response<VehicleBookingList>>();

  StreamSink<Response<VehicleBookingList>> get vehicleBookingListDataSink =>
      _vehicleBookingListDataController.sink;

  Stream<Response<VehicleBookingList>>? get vehicleBookingListDataStream =>
      _vehicleBookingListDataController.stream;

  VehicleBookingListBloc() {
    _vehicleBookingListRepository = VehicleBookingListRepository ();
    getColourListBloc();
  }

  getColourListBloc() async {
    vehicleBookingListDataSink.add(Response.loading('Fetching...'));
    try {
      VehicleBookingList _vehicleBookingList = await _vehicleBookingListRepository.vehicleBookingList();
      vehicleBookingListDataSink.add(Response.success(_vehicleBookingList));
    } catch (e) {
      vehicleBookingListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _vehicleBookingListDataController.close();
  }
}