
import 'package:newtron_vehicle/network/webApiProvider.dart';

class ModelCreationRepository {
  Future modelCreation(String model_name,String vehicle_name,String specification,String price,String dealer_price,String model_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: model_id =="0"?"/api/model_add?model_name=${model_name}&vechicle_name=${vehicle_name}&specification=${specification}&price=${price}&dealer_price=${dealer_price}":"/api/model_add?model_name=${model_name}&vechicle_name=${vehicle_name}&specification=${specification}&price=${price}&dealer_price=${dealer_price}&model_id=${model_id}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
