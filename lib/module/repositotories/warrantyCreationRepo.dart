import 'package:newtron_vehicle/network/webApiProvider.dart';

class WarrantyCreationRepository {
  Future warrantyCreation(
      String vehicleName,
      String cd,
      String identificationNumber,
      String claimDate,
      String customerName,
      String cusContactNumber,
      String cusEmail,
      String dealerName,
      String dealerContactNumber,
      String dealerEmail,
      String complaint
      ) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url:
            "/api/warrenty_add?type=1&cd=${cd}&vechicle_name=${vehicleName}&dealer_name=${dealerName}&dealer_no=${dealerContactNumber}&dealer_email=${dealerEmail}&customer_name=${customerName}&customer_no=${cusContactNumber}&customer_email=${cusEmail}&vechicle_identification_num=${identificationNumber}&claim_date=${claimDate}&complaint=${complaint}",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return response;
  }
}
