import 'dart:async';

import 'package:newtron_vehicle/network/response.dart';
import '../modelClasses/sparepartsBookingLIstModel.dart';
import '../modelClasses/sparepartsListModel.dart';
import '../repositotories/spare_partsListRepo.dart';
import '../repositotories/sparepartsBookingRepo.dart';


class SparePartsBookingListBloc {
  SparePartsBookingListRepository _sparepartsBookingListepository = new SparePartsBookingListRepository ();
  final _sparepartsBookingListDataController = StreamController<
      Response<SparePartsBookingList>>();

  StreamSink<
      Response<SparePartsBookingList>> get sparepartsBookingListDataSink =>
      _sparepartsBookingListDataController.sink;

  Stream<
      Response<SparePartsBookingList>>? get sparespartsBookingListDataStream =>
      _sparepartsBookingListDataController.stream;

  SparePartsBookingListBloc() {
    _sparepartsBookingListepository = SparePartsBookingListRepository();
    getSparepartsBookingListBloc();
  }

  getSparepartsBookingListBloc() async {
    sparepartsBookingListDataSink.add(Response.loading('Fetching...'));
    try {
      SparePartsBookingList _sparepartsBookingList = await _sparepartsBookingListepository
          .sparepartsBookingList();
      sparepartsBookingListDataSink.add(
          Response.success(_sparepartsBookingList));
    } catch (e) {
      sparepartsBookingListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _sparepartsBookingListDataController.close();
  }
}