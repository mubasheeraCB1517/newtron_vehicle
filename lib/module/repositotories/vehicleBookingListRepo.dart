import 'package:newtron_vehicle/module/modelClasses/modelListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleBookingListModel.dart';
import 'package:newtron_vehicle/network/webApiProvider.dart';

class VehicleBookingListRepository {
  Future vehicleBookingList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/vechicle_booking_list",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return VehicleBookingList.fromJson(response);
  }
}
