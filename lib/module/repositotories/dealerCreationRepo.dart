import 'package:newtron_vehicle/network/webApiProvider.dart';


class DealerCreationRepository {
  Future dealerCreation(String dealer_name,String address,String contact_no,String email,String gst_in,String state_id,String place,String password,String id  ) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url:  state_id =="0"
        ?"/api/dealer_add?type=1&status=2&dealer_name=${dealer_name}&address=${address}&contact_no=${contact_no}&email=${email}&gst_in=${gst_in}&state_name=${state_id}&place=${place}&dlt_status=1&password=${password}"
            :"/api/dealer_add?type=1&status=2&dealer_name=${dealer_name}&address=${address}&contact_no=${contact_no}&email=${email}&gst_in=${gst_in}&state_name=${state_id}&place=${place}&dlt_status=1&id=${id}&password=${password}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
