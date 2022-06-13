
import 'package:newtron_vehicle/network/webApiProvider.dart';

class WarrentyDeleteRepository {
  Future warrentyDelete(String warrenty_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/warrenty_delete?id=${warrenty_id}&status=0",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
