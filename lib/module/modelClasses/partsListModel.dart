class PartsList {
  List<dynamic>? data;
  String? message;
  int? success;

  PartsList({this.data, this.message, this.success});

  factory PartsList.fromJson(Map<String, dynamic> json) {
    return PartsList(
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
      data['`data`'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? created_at;
  String? dealer_price;
  String? parts;
  int? parts_id;
  String? price;
  String? specification;
  String? updated_at;
  String? vechicle_name;

  Data(
      {this.created_at,
      this.dealer_price,
      this.parts,
      this.parts_id,
      this.price,
      this.specification,
      this.updated_at,
      this.vechicle_name});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      created_at: json['created_at'],
      dealer_price: json['dealer_price'],
      parts: json['parts_name'],
      parts_id: json['parts_id'],
      price: json['price'],
      specification: json['specification'],
      updated_at: json['updated_at'],
      vechicle_name: json['vechicle_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.created_at;
    data['dealer_price'] = this.dealer_price;
    data['parts'] = this.parts;
    data['parts_id'] = this.parts_id;
    data['price'] = this.price;
    data['specification'] = this.specification;
    data['updated_at'] = this.updated_at;
    data['vechicle_name'] = this.vechicle_name;
    return data;
  }
}
