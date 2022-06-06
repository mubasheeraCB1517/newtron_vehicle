
import 'package:newtron_vehicle/network/webApiProvider.dart';

class ColorCreationRepository {
  Future colorCreation(String colour_name,String specification,String price,String dealer_price) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/color_add?color_name=${colour_name}&specification=${specification}&price=${price}&dealer_price=${dealer_price}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
