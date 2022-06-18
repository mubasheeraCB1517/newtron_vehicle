import 'package:newtron_vehicle/network/webApiProvider.dart';

class CustomerDeleteRepository {
  Future customerdelete(String id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/customer_delete?id=${id}&status=0",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
