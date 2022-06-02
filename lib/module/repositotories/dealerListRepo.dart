


import 'package:newtron_vehicle/network/webApiProvider.dart';

import '../modelClasses/dealerListModel.dart';

class DealerListRepository {
  Future dealerList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/dealer_list",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return DealerList.fromJson(response);
  }
}