
import 'package:newtron_vehicle/network/webApiProvider.dart';

class ModelEditRepository {
  Future modelEdit(String model_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/model_show?model_id=${model_id}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
