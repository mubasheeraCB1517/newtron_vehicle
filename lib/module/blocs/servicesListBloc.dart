
import 'dart:async';

import 'package:newtron_vehicle/module/modelClasses/servicesList.dart';
import 'package:newtron_vehicle/module/repositotories/servicesListRepository.dart';
import 'package:newtron_vehicle/network/response.dart';



class ServicesListBloc{
  ServicesListRepository  _servicesListepository = new ServicesListRepository ();
  final _serviceListDataController= StreamController<Response<ServicesList>>();

  StreamSink<Response<ServicesList>> get serviceListDataSink =>
      _serviceListDataController.sink;

  Stream<Response<ServicesList>>? get serviceListDataStream =>
      _serviceListDataController.stream;

  ServicesListBloc() {
    _servicesListepository  = ServicesListRepository ();
    getServiceListBloc();
  }

  getServiceListBloc() async {
    serviceListDataSink.add(Response.loading('Fetching...'));
    try {
      ServicesList _servicesList = await _servicesListepository .servicesList();
      serviceListDataSink.add(Response.success(_servicesList));
    } catch (e) {
      serviceListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _serviceListDataController.close();
  }
}