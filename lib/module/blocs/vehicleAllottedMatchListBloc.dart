
import 'dart:async';
import 'package:newtron_vehicle/module/modelClasses/vehicleAllottedMatchListModel.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleAllottedMatchListRepo.dart';
import 'package:newtron_vehicle/network/response.dart';



class VehicleAllottedMatchListBloc{
  VehicleAllottedMatchListRepository  _vehicleAllottedMatchListepository = new VehicleAllottedMatchListRepository ();
  final _vehicleAllottedMatchListDataController= StreamController<Response<VehicleAllottedMatchList>>();

  StreamSink<Response<VehicleAllottedMatchList>> get vehicleAllottedMatchListDataSink =>
      _vehicleAllottedMatchListDataController.sink;

  Stream<Response<VehicleAllottedMatchList>>? get vehicleAllottedMatchListDataStream =>
      _vehicleAllottedMatchListDataController.stream;

  VehicleAllottedMatchListBloc(String id, String vehicle_id, String model_id,
      String color_id, String battery_id) {
    _vehicleAllottedMatchListepository  = VehicleAllottedMatchListRepository ();
    getVehicleAllottedMatchListBloc(id,vehicle_id,model_id,color_id,battery_id);
  }

  getVehicleAllottedMatchListBloc(String id, String vehicle_id, String model_id,
      String color_id, String battery_id) async {
    vehicleAllottedMatchListDataSink.add(Response.loading('Fetching...'));
    try {
      VehicleAllottedMatchList _vehicleAllottedMatchList = await _vehicleAllottedMatchListepository.vehicelAllottedMatchList(id,vehicle_id,model_id,color_id,battery_id);
      vehicleAllottedMatchListDataSink.add(Response.success(_vehicleAllottedMatchList));
    } catch (e) {
      vehicleAllottedMatchListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _vehicleAllottedMatchListDataController.close();
  }
}