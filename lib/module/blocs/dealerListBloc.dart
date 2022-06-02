
import 'dart:async';


import 'package:newtron_vehicle/network/response.dart';

import '../modelClasses/dealerListModel.dart';
import '../repositotories/dealerListRepo.dart';


class DealerListBloc{
  DealerListRepository  _dealerListRepository = new DealerListRepository ();
  final _dealerListDataController= StreamController<Response<DealerList>>();

  StreamSink<Response<DealerList>> get dealerListDataSink =>
      _dealerListDataController.sink;

  Stream<Response<DealerList>>? get dealerListDataStream =>
      _dealerListDataController.stream;

  DealerListBloc() {
    _dealerListRepository = DealerListRepository ();
    getdealerListBloc();
  }

  getdealerListBloc() async {
    dealerListDataSink.add(Response.loading('Fetching...'));
    try {
      DealerList _dealerList = await _dealerListRepository.dealerList();
      dealerListDataSink.add(Response.success(_dealerList));
    } catch (e) {
      dealerListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _dealerListDataController.close();
  }
}