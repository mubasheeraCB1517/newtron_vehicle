import 'package:newtron_vehicle/network/webApiProvider.dart';

import '../modelClasses/customerListModel.dart';

class CustomerListRepository {
  Future customerList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/customer_list",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return CustomerList.fromJson(response);
  }
}
