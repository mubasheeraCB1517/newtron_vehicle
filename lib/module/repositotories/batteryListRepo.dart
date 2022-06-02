


import 'package:newtron_vehicle/network/webApiProvider.dart';
import '../modelClasses/batteryListModel.dart';

class BatteryListRepository {
  Future batteryList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/battery_list",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return BatteryList.fromJson(response);
  }
}