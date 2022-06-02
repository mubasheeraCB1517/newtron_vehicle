

import 'package:newtron_vehicle/module/modelClasses/vehicleListModel.dart';
import 'package:newtron_vehicle/network/webApiProvider.dart';

import '../modelClasses/warrantyListModel.dart';

class WarrantyListRepository {
  Future warrantyList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/warrenty_list",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return WarrantyList.fromJson(response);
  }
}