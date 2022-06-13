import 'package:newtron_vehicle/module/modelClasses/vehicleAllotedListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleAllottedMatchListModel.dart';
import 'package:newtron_vehicle/network/webApiProvider.dart';

class VehicleAllottedMatchListRepository {
  Future vehicelAllottedMatchList(String id, String vehicle_id, String model_id,
      String color_id, String battery_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url:
            "/api/vechicle_alloted_show?id=${id}&color_name=${color_id}&battery_name=${battery_id}&model_name=${model_id}&vechicle_name=${vehicle_id}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return VehicleAllottedMatchList.fromJson(response);
  }
}
