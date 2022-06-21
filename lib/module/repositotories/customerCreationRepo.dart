import 'package:newtron_vehicle/network/webApiProvider.dart';
class CustomerCreationRepository {
  Future customerCreation(
      String vechicle_id,
      String dealerName,
      String customerName,
      String contactNumber,
      String email,
      String Number,
      String motorNumber,
      String id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: vechicle_id == "0"
            ?"/api/customer_add?type=2&vechicle_name=${vechicle_id}&dealer_name=${dealerName}&customer_name=${customerName}&customer_no=${contactNumber}&customer_email=${email}&vechicle_identification_num=${Number}&motor_num=${motorNumber}"
            :"/api/customer_add?type=2&vechicle_name=${vechicle_id}&dealer_name=${dealerName}&customer_name=${customerName}&customer_no=${contactNumber}&customer_email=${email}&vechicle_identification_num=${Number}&motor_num=${motorNumber}&id=${id}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
