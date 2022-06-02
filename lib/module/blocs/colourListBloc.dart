
import 'dart:async';
import 'package:newtron_vehicle/module/modelClasses/colourListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleListModel.dart';
import 'package:newtron_vehicle/module/repositotories/colourListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleListRepo.dart';
import 'package:newtron_vehicle/network/response.dart';

class ColourListBloc{
  ColourListRepository  _colourListRepository = new ColourListRepository ();
  final _colourListDataController= StreamController<Response<ColourList>>();

  StreamSink<Response<ColourList>> get colourListDataSink =>
      _colourListDataController.sink;

  Stream<Response<ColourList>>? get colourListDataStream =>
      _colourListDataController.stream;

  ColourListBloc() {
    _colourListRepository = ColourListRepository ();
    getColourListBloc();
  }

  getColourListBloc() async {
    colourListDataSink.add(Response.loading('Fetching...'));
    try {
      ColourList _colourList = await _colourListRepository.colourList();
      colourListDataSink.add(Response.success(_colourList));
    } catch (e) {
      colourListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _colourListDataController.close();
  }
}