
import 'dart:async';

import 'package:newtron_vehicle/network/response.dart';
import '../modelClasses/sparepartsListModel.dart';
import '../repositotories/spare_partsListRepo.dart';



class SparePartsListBloc{
  SparePartsListRepository  _sparepartsListepository = new SparePartsListRepository ();
  final _sparepartsListDataController= StreamController<Response<SparePartsList>>();

  StreamSink<Response<SparePartsList>> get spareListDataSink =>
      _sparepartsListDataController.sink;

  Stream<Response<SparePartsList>>? get sparesListDataStream =>
      _sparepartsListDataController.stream;

  SparePartsListBloc() {
    _sparepartsListepository  = SparePartsListRepository ();
    getSparepartsListBloc();
  }

  getSparepartsListBloc() async {
    spareListDataSink.add(Response.loading('Fetching...'));
    try {
      SparePartsList _sparepartsList = await _sparepartsListepository .sparepartsList();
      spareListDataSink.add(Response.success(_sparepartsList));
    } catch (e) {
      spareListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _sparepartsListDataController.close();
  }
}