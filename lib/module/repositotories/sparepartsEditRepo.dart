import 'package:newtron_vehicle/module/modelClasses/vehicleListModel.dart';
import 'package:newtron_vehicle/network/webApiProvider.dart';

class SparePartsEditRepository {
  Future sparepartsEdit(String spare_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/spare_parts_show?spare_id=${spare_id}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
