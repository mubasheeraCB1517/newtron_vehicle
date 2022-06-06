import 'package:newtron_vehicle/network/webApiProvider.dart';


class BatteryCreationRepository {
  Future batteryCreation(String battery_name,String specification,String price,String dealer_price  ) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/battery_add?battery_name=${battery_name}&specification=${specification}&price=${price}&dealer_price=${dealer_price}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
