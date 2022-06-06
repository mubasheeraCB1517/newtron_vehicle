import 'package:newtron_vehicle/network/webApiProvider.dart';


class DealerCreationRepository {
  Future dealerCreation(String dealer_name,String address,String contact_no,String email,String gst_in,String state,String place  ) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/dealer_add?type=1&status=2&dealer_name=${dealer_name}&address=${address}&contact_no=${contact_no}&email=${email}&gst_in=${gst_in}&state=${state}&place=${place}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
