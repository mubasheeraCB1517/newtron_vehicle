class DealerList {
  List<dynamic>? data;
  String? message;
  int? success;

  DealerList({this.data, this.message, this.success});

  factory DealerList.fromJson(Map<String, dynamic> json) {
    return DealerList(
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
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? address;
  String? battery;
  String? booking_date;
  String? color;
  String? contact_no;
  String? created_at;
  String? customer_name;
  String? dealer_name;
  String? email;
  String? gst_in;
  int? id;
  String? is_admin;
  String? model;
  String? password;
  String? place;
  String? state;
  String? status;
  String? type;
  String? updated_at;
  String? vechicle_name;
  String? vechicle_status;

  Data(
      {this.address,
      this.battery,
      this.booking_date,
      this.color,
      this.contact_no,
      this.created_at,
      this.customer_name,
      this.dealer_name,
      this.email,
      this.gst_in,
      this.id,
      this.is_admin,
      this.model,
      this.password,
      this.place,
      this.state,
      this.status,
      this.type,
      this.updated_at,
      this.vechicle_name,
      this.vechicle_status});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      address: json['address'],
      battery: json['battery'],
      booking_date: json['booking_date'],
      color: json['color'],
      contact_no: json['contact_no'],
      created_at: json['created_at'],
      customer_name: json['customer_name'],
      dealer_name: json['dealer_name'],
      email: json['email'],
      gst_in: json['gst_in'],
      id: json['id'],
      is_admin: json['is_admin'],
      model: json['model'],
      password: json['password'],
      place: json['place'],
      state: json['state_name'],
      status: json['status'],
      type: json['type'],
      updated_at: json['updated_at'],
      vechicle_name: json['vechicle_name'],
      vechicle_status: json['vechicle_status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['contact_no'] = this.contact_no;
    data['created_at'] = this.created_at;
    data['dealer_name'] = this.dealer_name;
    data['email'] = this.email;
    data['gst_in'] = this.gst_in;
    data['id'] = this.id;
    data['is_admin'] = this.is_admin;
    data['place'] = this.place;
    data['state'] = this.state;
    data['status'] = this.status;
    data['type'] = this.type;
    data['updated_at'] = this.updated_at;
    if (this.battery != null) {
      data['battery'] = this.battery;
    }
    if (this.booking_date != null) {
      data['booking_date'] = this.booking_date;
    }
    if (this.color != null) {
      data['color'] = this.color;
    }
    if (this.customer_name != null) {
      data['customer_name'] = this.customer_name;
    }
    if (this.model != null) {
      data['model'] = this.model;
    }
    if (this.password != null) {
      data['password'] = this.password;
    }
    if (this.vechicle_name != null) {
      data['vechicle_name'] = this.vechicle_name;
    }
    if (this.vechicle_status != null) {
      data['vechicle_status'] = this.vechicle_status;
    }
    return data;
  }
}
