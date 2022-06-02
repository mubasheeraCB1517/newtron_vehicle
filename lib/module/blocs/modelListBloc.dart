
import 'dart:async';
import 'package:newtron_vehicle/module/modelClasses/colourListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/modelListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleListModel.dart';
import 'package:newtron_vehicle/module/repositotories/colourListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/modelListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleListRepo.dart';
import 'package:newtron_vehicle/network/response.dart';

class ModelListBloc{
  ModelListRepository  _modelListRepository = new ModelListRepository ();
  final _modelListDataController= StreamController<Response<ModelList>>();

  StreamSink<Response<ModelList>> get modelListDataSink =>
      _modelListDataController.sink;

  Stream<Response<ModelList>>? get modelListDataStream =>
      _modelListDataController.stream;

  ModelListBloc() {
    _modelListRepository = ModelListRepository ();
    getModelListBloc();
  }

  getModelListBloc() async {
    modelListDataSink.add(Response.loading('Fetching...'));
    try {
      ModelList _modelList = await _modelListRepository.modelList();
      modelListDataSink.add(Response.success(_modelList));
    } catch (e) {
      modelListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _modelListDataController.close();
  }
}