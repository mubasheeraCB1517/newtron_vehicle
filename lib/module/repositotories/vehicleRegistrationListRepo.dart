

import 'package:newtron_vehicle/module/modelClasses/vehicleRegistrationListModel.dart';
import 'package:newtron_vehicle/network/webApiProvider.dart';

class VehicleRegistrationListRepository {
  Future vehicleRegistrationList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/vechicle_registration_list",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return VehicleRegistrationList.fromJson(response);
  }
}