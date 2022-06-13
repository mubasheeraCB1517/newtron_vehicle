
import 'package:newtron_vehicle/network/webApiProvider.dart';

class DealerDeleteRepository {
  Future dealerDelete(String dealer_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/dealer_delete?id=${dealer_id}&status=0",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
