import 'dart:async';

import 'package:newtron_vehicle/module/modelClasses/batteryListModel.dart';
import 'package:newtron_vehicle/network/response.dart';

import '../modelClasses/stateListModel.dart';
import '../repositotories/batteryListRepo.dart';
import '../repositotories/stateListRepo.dart';

class StateListBloc {
  StateListRepository _stateListRepository = new StateListRepository();
  final _stateListDataController = StreamController<Response<StateList>>();

  StreamSink<Response<StateList>> get stateListDataSink =>
      _stateListDataController.sink;

  Stream<Response<StateList>>? get stateListDataStream =>
      _stateListDataController.stream;

  StateListBloc() {
    _stateListRepository= StateListRepository();
    getStateListBloc();
  }

  getStateListBloc() async {
    stateListDataSink.add(Response.loading('Fetching...'));
    try {
      StateList _stateList = await _stateListRepository.stateList();
      stateListDataSink.add(Response.success(_stateList));
    } catch (e) {
      stateListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _stateListDataController.close();
  }
}
