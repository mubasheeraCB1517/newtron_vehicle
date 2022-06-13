import 'package:newtron_vehicle/module/modelClasses/vehicleAllotedListModel.dart';
import 'package:newtron_vehicle/network/webApiProvider.dart';

class VehicleAllottedListRepository {
  Future vehicelAllottedList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/vechicle_alloted_list",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return VehicleAllottedList.fromJson(response);
  }
}
