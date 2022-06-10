import 'package:newtron_vehicle/network/webApiProvider.dart';

class BatteryDeleteRepository {
  Future batterydelete(String battery_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/battery_delete?battery_id=${battery_id}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
