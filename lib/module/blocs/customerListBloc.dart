
import 'dart:async';
import 'package:newtron_vehicle/module/modelClasses/colourListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleListModel.dart';
import 'package:newtron_vehicle/module/repositotories/colourListRepo.dart';
import 'package:newtron_vehicle/module/repositotories/vehicleListRepo.dart';
import 'package:newtron_vehicle/network/response.dart';

import '../modelClasses/customerListModel.dart';
import '../repositotories/customerListRepo.dart';

class CustomerListBloc{
  CustomerListRepository  _customerListRepository = new CustomerListRepository ();
  final _customerListDataController= StreamController<Response<CustomerList>>();

  StreamSink<Response<CustomerList>> get customerListDataSink =>
      _customerListDataController.sink;

  Stream<Response<CustomerList>>? get customerListDataStream =>
      _customerListDataController.stream;

  CustomerListBloc() {
    _customerListRepository = CustomerListRepository ();
    getCustomerListBloc();
  }

  getCustomerListBloc() async {
    customerListDataSink.add(Response.loading('Fetching...'));
    try {
      CustomerList _customerList = await _customerListRepository.customerList();
      customerListDataSink.add(Response.success(_customerList));
    } catch (e) {
      customerListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _customerListDataController.close();
  }
}