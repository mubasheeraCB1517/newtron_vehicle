
import 'dart:async';
import 'package:newtron_vehicle/module/modelClasses/vehicleListModel.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleListRepo.dart';
import 'package:newtron_vehicle/network/response.dart';

class VehicleListBloc{
  VehicleListRepository  _vehicleListRepository = new VehicleListRepository ();
  final _vehicleListDataController= StreamController<Response<VehicleList>>();

  StreamSink<Response<VehicleList>> get vehicleListDataSink =>
      _vehicleListDataController.sink;

  Stream<Response<VehicleList>>? get vehicleListDataStream =>
      _vehicleListDataController.stream;

  VehicleListBloc() {
    _vehicleListRepository = VehicleListRepository ();
    getVehicleListBloc();
  }

  getVehicleListBloc() async {
    vehicleListDataSink.add(Response.loading('Fetching...'));
    try {
   VehicleList _vehicleList = await _vehicleListRepository.vehicleList();
      vehicleListDataSink.add(Response.success(_vehicleList));
    } catch (e) {
      vehicleListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _vehicleListDataController.close();
  }
}