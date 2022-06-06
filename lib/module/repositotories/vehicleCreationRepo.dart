
import 'package:newtron_vehicle/network/webApiProvider.dart';

class VehicleCreationRepository {
  Future vehicleCreation(String vehicle_name,String model_name,String battery_name,String amount) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/vechicle_add?model_name=${model_name}&vechicle_name=${vehicle_name}&battery_name=${battery_name}&amount=${amount}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
