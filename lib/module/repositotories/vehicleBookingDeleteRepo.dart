
import 'package:newtron_vehicle/network/webApiProvider.dart';

class VehicleBookingDeleteRepository {
  Future vehicleBookingDelete(String id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/vechicle_booking_delete?id=${id}&status=0",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
