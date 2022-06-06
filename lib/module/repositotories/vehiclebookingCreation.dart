import 'package:newtron_vehicle/network/webApiProvider.dart';


class VehicleBookingCreationRepository {
  Future vehiclebookingCreation(String customer_name,String dealer_name,String contact_no,String email,String vechicle_name,String battery_name,String color_name,String booking_date,String vechicle_status ) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/vechicle_booking_add?type=1&status=1&customer_name=${customer_name}&dealer_name=${dealer_name}&contact_no=${contact_no}&email=${email}&vechicle_name=${vechicle_name}&battery_name=${battery_name}&color_name=${color_name}&booking_date=${booking_date}&vechicle_status=${vechicle_status}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
