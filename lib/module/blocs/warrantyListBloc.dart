
import 'dart:async';

import 'package:newtron_vehicle/network/response.dart';

import '../modelClasses/warrantyListModel.dart';
import '../repositotories/warrantyListRepo.dart';

class WarrantyListBloc{
  WarrantyListRepository  _warrantyListRepository = new WarrantyListRepository ();
  final _warrantyListDataController= StreamController<Response<WarrantyList>>();

  StreamSink<Response<WarrantyList>> get warrantyListDataSink =>
      _warrantyListDataController.sink;

  Stream<Response<WarrantyList>>? get warrantyListDataStream =>
      _warrantyListDataController.stream;

  WarrantyListBloc() {
    _warrantyListRepository  = WarrantyListRepository ();
    getWarrantyListBloc();
  }

  getWarrantyListBloc() async {
    warrantyListDataSink.add(Response.loading('Fetching...'));
    try {
      WarrantyList _warrantyList = await _warrantyListRepository .warrantyList();
      warrantyListDataSink.add(Response.success(_warrantyList));
    } catch (e) {
      warrantyListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _warrantyListDataController.close();
  }
}