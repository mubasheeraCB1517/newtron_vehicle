import 'package:newtron_vehicle/module/modelClasses/modelListModel.dart';
import 'package:newtron_vehicle/module/modelClasses/vehicleBookingListModel.dart';
import 'package:newtron_vehicle/network/webApiProvider.dart';

import '../modelClasses/sparepartsBookingLIstModel.dart';

class SparePartsBookingListRepository {
  Future sparepartsBookingList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/spare_parts_booking_list",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return SparePartsBookingList.fromJson(response);
  }
}
