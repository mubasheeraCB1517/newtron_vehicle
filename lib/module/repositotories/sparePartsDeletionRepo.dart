
import 'package:newtron_vehicle/network/webApiProvider.dart';

class SparePartsDeleteRepository {
  Future sparePartsDelete(String spare_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/spare_parts_delete?spare_id=${spare_id}&status=0",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
