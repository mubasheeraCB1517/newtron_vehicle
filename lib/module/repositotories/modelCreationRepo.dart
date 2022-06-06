
import 'package:newtron_vehicle/network/webApiProvider.dart';

class ModelCreationRepository {
  Future modelCreation(String model_name,String vehicle_name,String specification,String price,String dealer_price) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/model_add?model_name=${model_name}&vechicle_name=${vehicle_name}&specification=${specification}&price=${price}&dealer_price=${dealer_price}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
