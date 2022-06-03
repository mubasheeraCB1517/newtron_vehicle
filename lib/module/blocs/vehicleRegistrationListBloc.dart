
import 'dart:async';
import 'package:newtron_vehicle/module/modelClasses/vehicleListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleRegistrationListModel.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleRegistrationListRepo.dart';
import 'package:newtron_vehicle/network/response.dart';

class VehicleRegistrationListBloc{
  VehicleRegistrationListRepository  _vehicleRegistrationListRepository = new VehicleRegistrationListRepository ();
  final _vehicleRegistrationListDataController= StreamController<Response<VehicleRegistrationList>>();

  StreamSink<Response<VehicleRegistrationList>> get vehicleRegistrationListDataSink =>
      _vehicleRegistrationListDataController.sink;

  Stream<Response<VehicleRegistrationList>>? get vehicleRegistrationListDataStream =>
      _vehicleRegistrationListDataController.stream;

  VehicleRegistrationListBloc() {
    _vehicleRegistrationListRepository = VehicleRegistrationListRepository ();
    getVehicleRegistrationListBloc();
  }

  getVehicleRegistrationListBloc() async {
    vehicleRegistrationListDataSink.add(Response.loading('Fetching...'));
    try {
      VehicleRegistrationList _vehicleRegistrationList = await _vehicleRegistrationListRepository.vehicleRegistrationList();
      vehicleRegistrationListDataSink.add(Response.success(_vehicleRegistrationList));
    } catch (e) {
      vehicleRegistrationListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _vehicleRegistrationListDataController.close();
  }
}