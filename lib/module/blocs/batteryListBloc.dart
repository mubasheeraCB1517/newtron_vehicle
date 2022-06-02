
import 'dart:async';

import 'package:newtron_vehicle/module/modelClasses/batteryListModel.dart';
import 'package:newtron_vehicle/network/response.dart';

import '../repositotories/batteryListRepo.dart';

class BatteryListBloc{
  BatteryListRepository  _batteryListRepository = new BatteryListRepository ();
  final _batteryListDataController= StreamController<Response<BatteryList>>();

  StreamSink<Response<BatteryList>> get batteryListDataSink =>
      _batteryListDataController.sink;

  Stream<Response<BatteryList>>? get batteryListDataStream =>
      _batteryListDataController.stream;

  BatteryListBloc() {
    _batteryListRepository = BatteryListRepository ();
    getbatteryListBloc();
  }

  getbatteryListBloc() async {
    batteryListDataSink.add(Response.loading('Fetching...'));
    try {
      BatteryList _batteryList = await _batteryListRepository.batteryList();
      batteryListDataSink.add(Response.success(_batteryList));
    } catch (e) {
      batteryListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _batteryListDataController.close();
  }
}