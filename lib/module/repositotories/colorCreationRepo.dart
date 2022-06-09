
import 'package:newtron_vehicle/network/webApiProvider.dart';

class ColorCreationRepository {
  Future colorCreation(String colour_name,String specification,String price,String dealer_price,String color_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url:color_id == "0"?
        "/api/color_add?color_name=${colour_name}&specification=${specification}&price=${price}&dealer_price=${dealer_price}":
        "/api/color_add?color_name=${colour_name}&specification=${specification}&price=${price}&dealer_price=${dealer_price}&color_id=${color_id}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
