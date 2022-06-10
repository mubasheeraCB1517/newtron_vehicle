
import 'package:newtron_vehicle/network/webApiProvider.dart';

class ModelDeleteRepository {
  Future modelDelete(String model_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/model_delete?model_id=${model_id}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
