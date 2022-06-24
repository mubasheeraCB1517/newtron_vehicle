import 'package:newtron_vehicle/module/modelClasses/servicesList.dart';
import 'package:newtron_vehicle/network/webApiProvider.dart';

class ServicesListRepository {
  Future servicesList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/service_list",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return ServicesList.fromJson(response);
  }
}
