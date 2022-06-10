
import 'package:newtron_vehicle/network/webApiProvider.dart';

class SparePartsEnquiryRepository {
  Future sparePartEnquiry(String spare_part_id) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/spare_parts_booking_show?spare_id=${spare_part_id}",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
