
import 'package:newtron_vehicle/network/webApiProvider.dart';

class WarrentyEditRepository {
  Future warrentyEdit(String warrenty_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/warrenty_show?id=${warrenty_id}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
