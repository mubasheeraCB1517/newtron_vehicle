import 'package:newtron_vehicle/network/webApiProvider.dart';

import '../modelClasses/sparepartsListModel.dart';

class SparePartsListRepository {
  Future sparepartsList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/spare_parts_list",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return SparePartsList.fromJson(response);
  }
}
