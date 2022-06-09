
import 'package:newtron_vehicle/network/webApiProvider.dart';

class ColorEditRepository {
  Future colorEdit(String color_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/color_show?color_id=${color_id}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
