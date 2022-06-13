
import 'package:newtron_vehicle/network/webApiProvider.dart';

class VehicleCreationRepository {
  Future vehicleCreation(String vehicle_name,
     String amount, String vehicle_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: vehicle_id == "0"
            ? "/api/vechicle_add?vechicle_name=${vehicle_name}&amount=${amount}&vechicle_id=0"
            : "/api/vechicle_add?vechicle_name=${vehicle_name}&amount=${amount}&vechicle_id=${vehicle_id}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
