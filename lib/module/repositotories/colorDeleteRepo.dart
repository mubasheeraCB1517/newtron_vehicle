
import 'package:newtron_vehicle/network/webApiProvider.dart';

class ColorDeleteRepository {
  Future colorDelete(String color_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/color_delete?color_id=${color_id}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
