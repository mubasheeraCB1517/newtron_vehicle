class VehicleBookingList {
  List<dynamic>? data;
  String? message;
  int? success;

  VehicleBookingList({this.data, this.message, this.success});

  factory VehicleBookingList.fromJson(Map<String, dynamic> json) {
    return VehicleBookingList(
      data: json['data'] != null
          ? (json['data'] as List).map((i) => Data.fromJson(i)).toList()
          : null,
      message: json['message'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? battery_name;
  String? booking_date;
  String? color_name;
  String? contact_no;
  String? created_at;
  String? customer_name;
  String? dealer_name;
  String? email;
  int? id;
  String? is_admin;
  String? status;
  String? type;
  String? updated_at;
  String? vechicle_name;
  String? vechicle_status;

  Data(
      {this.battery_name,
      this.booking_date,
      this.color_name,
      this.contact_no,
      this.created_at,
      this.customer_name,
      this.dealer_name,
      this.email,
      this.id,
      this.is_admin,
      this.status,
      this.type,
      this.updated_at,
      this.vechicle_name,
      this.vechicle_status});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      battery_name: json['battery_name'],
      booking_date: json['booking_date'],
      color_name: json['color_name'],
      contact_no: json['contact_no'],
      created_at: json['created_at'],
      customer_name: json['customer_name'],
      dealer_name: json['dealer_name'],
      email: json['email'],
      id: json['id'],
      is_admin: json['is_admin'],
      status: json['status'],
      type: json['type'],
      updated_at: json['updated_at'],
      vechicle_name: json['vechicle_name'],
      vechicle_status: json['vechicle_status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['battery_name'] = this.battery_name;
    data['booking_date'] = this.booking_date;
    data['color_name'] = this.color_name;
    data['contact_no'] = this.contact_no;
    data['created_at'] = this.created_at;
    data['customer_name'] = this.customer_name;
    data['dealer_name'] = this.dealer_name;
    data['email'] = this.email;
    data['id'] = this.id;
    data['is_admin'] = this.is_admin;
    data['status'] = this.status;
    data['type'] = this.type;
    data['updated_at'] = this.updated_at;
    data['vechicle_name'] = this.vechicle_name;
    data['vechicle_status'] = this.vechicle_status;
    return data;
  }
}
