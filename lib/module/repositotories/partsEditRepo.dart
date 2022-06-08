import 'package:newtron_vehicle/network/webApiProvider.dart';

class PartsEditRepository {
  Future partsEdit(String parts_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/parts_show?parts_id=${parts_id}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
