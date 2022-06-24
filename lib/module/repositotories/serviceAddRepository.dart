import 'package:newtron_vehicle/network/webApiProvider.dart';

class ServicesAddRepository {
  Future servicesAdd(String service_id,String service_change,String services,String vehicle_id_no,String vehicle_name,String customer_no,String service_status,String customer_name) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/service_add?service_id=${service_id}&status=1&service_change=${service_change}&services=${services}&vechicle_name=${vehicle_name}&vechicle_identification_num=${vehicle_id_no}&customer_name=${customer_name}&customer_no=${customer_no}&service_status=${service_status}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
