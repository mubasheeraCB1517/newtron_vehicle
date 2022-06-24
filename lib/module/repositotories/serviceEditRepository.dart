import 'package:newtron_vehicle/network/webApiProvider.dart';

class ServicesEditRepository {
  Future servicesEdit(String service_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/service_show?service_id=${service_id}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
