import 'package:newtron_vehicle/network/webApiProvider.dart';


class SparePartsCreationRepository {
  Future sparepartsCreation(String vechicle_identification_num,String motor_num,String vechicle_name,String customer_name,String parts_name,String price,String spare_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};

    final response = await WebApiProvider().getData(
        url: spare_id =="0"
        ? "/api/spare_parts_add?status=1&vechicle_identification_num=${vechicle_identification_num}&motor_num=${motor_num}&vechicle_name=${vechicle_name}&customer_name=${customer_name}&parts_name=${parts_name}&price=${price}"
          : "/api/spare_parts_add?status=1&vechicle_identification_num=${vechicle_identification_num}&motor_num=${motor_num}&vechicle_name=${vechicle_name}&customer_name=${customer_name}&parts_name=${parts_name}&price=${price}&spare_id=${spare_id}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);

    return response;

  }
}
