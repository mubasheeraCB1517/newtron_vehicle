import 'package:newtron_vehicle/network/webApiProvider.dart';

class BatteryEditRepository {
  Future batteryEdit(String battery_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/battery_show?battery_id=${battery_id}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
