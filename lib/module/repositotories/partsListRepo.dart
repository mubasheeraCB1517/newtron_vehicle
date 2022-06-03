import 'package:newtron_vehicle/network/webApiProvider.dart';

import '../modelClasses/partsListModel.dart';

class PartsListRepository {
  Future partsList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/parts_list",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return PartsList.fromJson(response);
  }
}
