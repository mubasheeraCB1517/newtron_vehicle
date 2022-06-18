import 'package:newtron_vehicle/module/modelClasses/vehicleListModel.dart';
import 'package:newtron_vehicle/network/webApiProvider.dart';

class VehicleBookingSaveRepository {
  Future vehicleBookingSave(
      String id,
      String customer_name,
      String dealer_name,
      String customer_no,
      String customer_email,
      String vechicle_name,
      String battery_name,
      String color_name,
      String booking_date,
      String vechicle_status,
      String model_name
      ) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url:
            "/api/vechicle_booking_edit?id=${id}&type=2&dlt_status=1&status=1&customer_name=${customer_name}&dealer_name=${dealer_name}&customer_no=${customer_no}&customer_email=${customer_email}&vechicle_name=${vechicle_name}&battery_name=${battery_name}&color_name=${color_name}&booking_date=${booking_date}&vechicle_status=${vechicle_status}&model_name=${model_name}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
