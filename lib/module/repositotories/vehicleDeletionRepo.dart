
import 'package:newtron_vehicle/network/webApiProvider.dart';

class VehicleDeleteRepository {
  Future vehicleDelete(String vehicle_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/vechicle_delete?vechicle_id=${vehicle_id}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
