import 'package:newtron_vehicle/network/webApiProvider.dart';

import '../modelClasses/sparepartsListModel.dart';
import '../modelClasses/stateListModel.dart';

class StateListRepository {
  Future stateList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/state_list",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return StateList.fromJson(response);
  }
}
