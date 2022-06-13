import 'package:newtron_vehicle/module/modelClasses/vehicleAllotedListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleAllottedMatchListModel.dart';
import 'package:newtron_vehicle/network/webApiProvider.dart';

class VehicleAllottedCheckRepository {
  Future vehicelAllottedCheck(String id, String id1, String reg_id,
      String book_id) async {
    print("/api/vechicle_alloted_add?id=${id}&id=${id1}&book_id=${book_id}&reg_id=${reg_id}&status=1&status=1");
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url:
        "/api/vechicle_alloted_add?id=${id}&id=${id1}&book_id=${book_id}&reg_id=${reg_id}&status=1&status=1",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
