

import 'package:newtron_vehicle/module/modelClasses/colourListModel.dart';
import 'package:newtron_vehicle/network/webApiProvider.dart';

class ColourListRepository {
  Future colourList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "/api/color_list",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return ColourList.fromJson(response);
  }
}