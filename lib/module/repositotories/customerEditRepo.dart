import 'package:newtron_vehicle/network/webApiProvider.dart';

class CustomerEditRepository {
  Future customerEdit(String id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/customer_show?id=${id}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
