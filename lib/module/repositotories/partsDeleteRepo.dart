import 'package:newtron_vehicle/network/webApiProvider.dart';

class PartsDeleteRepository {
  Future partsdelete(String parts_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/parts_delete?parts_id=${parts_id}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
