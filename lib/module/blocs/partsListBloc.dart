
import 'dart:async';

import 'package:newtron_vehicle/network/response.dart';

import '../modelClasses/partsListModel.dart';
import '../repositotories/partsListRepo.dart';



class PartsListBloc{
  PartsListRepository  _partsListepository = new PartsListRepository ();
  final _partsListDataController= StreamController<Response<PartsList>>();

  StreamSink<Response<PartsList>> get partsListDataSink =>
      _partsListDataController.sink;

  Stream<Response<PartsList>>? get partsListDataStream =>
      _partsListDataController.stream;

  PartsListBloc() {
    _partsListepository  = PartsListRepository ();
    getpartsListBloc();
  }

  getpartsListBloc() async {
    partsListDataSink.add(Response.loading('Fetching...'));
    try {
      PartsList _partsList = await _partsListepository .partsList();
      partsListDataSink.add(Response.success(_partsList));
    } catch (e) {
      partsListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _partsListDataController.close();
  }
}