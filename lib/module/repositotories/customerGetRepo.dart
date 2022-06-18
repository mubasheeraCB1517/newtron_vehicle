
import 'package:newtron_vehicle/module/modelClasses/customerGetModel.dart';
import 'package:newtron_vehicle/network/webApiProvider.dart';

import '../modelClasses/customerListModel.dart';

class CustomerGetRepository {
  Future customerGet(String vehicle_id,String vehicle_identification_num) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/warrenty_test?vechicle_id=${vehicle_id}&vechicle_identification_num=${vehicle_identification_num}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return CustomerGetList.fromJson(response);
  }
}
