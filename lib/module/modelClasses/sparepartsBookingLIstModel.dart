class SparePartsBookingList {
  List<dynamic>? data;
  String? message;
  int? success;

  SparePartsBookingList({this.data, this.message, this.success});

  factory SparePartsBookingList.fromJson(Map<String, dynamic> json) {
    return SparePartsBookingList(
      data: json['data'] != null ? (json['data'] as List).map((i) =>
          Data.fromJson(i)).toList() : null,
      message: json['message'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.data != null) {
      data['`data`'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? customer_name;
  String? motor_num;
  String? parts_name;
  String? price;
  String? vechicle_identification_num;
  String? vechicle_name;
  String? spare_id;

  Data(
      {this.customer_name, this.motor_num, this.parts_name, this.price, this.vechicle_identification_num, this.vechicle_name,this.spare_id});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      customer_name: json['customer_name'],
      motor_num: json['motor_num'],
      parts_name: json['parts_name'],
      price: json['price'],
      vechicle_identification_num: json['vechicle_identification_num'],
      vechicle_name: json['vechicle_name'],
      spare_id: json['spare_id'].toString()
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_name'] = this.customer_name;
    data['motor_num'] = this.motor_num;
    data['parts_name'] = this.parts_name;
    data['price'] = this.price;
    data['vechicle_identification_num'] = this.vechicle_identification_num;
    data['vechicle_name'] = this.vechicle_name;
    data['spare_id'] = this.spare_id;
    return data;
  }
}