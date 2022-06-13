class CustomerList {
    List<dynamic>? data;
    String? message;
    int? success;

    CustomerList({this.data, this.message, this.success});

    factory CustomerList.fromJson(Map<String, dynamic> json) {
        return CustomerList(
            data: json['data'] != null ? (json['data'] as List).map((i) => Data.fromJson(i)).toList() : null,
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
    String? cd;
    String? claim_date;
    String? complaint;
    String? created_at;
    String? customer_email;
    String? customer_name;
    String? customer_no;
    String? dealer_email;
    String? dealer_name;
    String? dealer_no;
    int? id;
    Object? motor_num;
    Object? spare_parts;
    String? status;
    String? type;
    String? updated_at;
    String? vechicle_identification_num;
    String? vechicle_name;
    Object? warrenty;

    Data({this.cd, this.claim_date, this.complaint, this.created_at, this.customer_email, this.customer_name, this.customer_no, this.dealer_email, this.dealer_name, this.dealer_no, this.id, this.motor_num, this.spare_parts, this.status, this.type, this.updated_at, this.vechicle_identification_num, this.vechicle_name, this.warrenty});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            cd: json['cd'],
            claim_date: json['claim_date'],
            complaint: json['complaint'],
            created_at: json['created_at'],
            customer_email: json['customer_email'],
            customer_name: json['customer_name'],
            customer_no: json['customer_no'],
            dealer_email: json['dealer_email'],
            dealer_name: json['dealer_name'],
            dealer_no: json['dealer_no'],
            id: json['id'],
            motor_num: json['motor_num'] ,
            spare_parts: json['spare_parts'] ,
            status: json['status'],
            type: json['type'],
            updated_at: json['updated_at'],
            vechicle_identification_num: json['vechicle_identification_num'],
            vechicle_name: json['vechicle_name'],
            warrenty: json['warrenty'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cd'] = this.cd;
        data['claim_date'] = this.claim_date;
        data['complaint'] = this.complaint;
        data['created_at'] = this.created_at;
        data['customer_email'] = this.customer_email;
        data['customer_name'] = this.customer_name;
        data['customer_no'] = this.customer_no;
        data['dealer_email'] = this.dealer_email;
        data['dealer_name'] = this.dealer_name;
        data['dealer_no'] = this.dealer_no;
        data['id'] = this.id;
        data['status'] = this.status;
        data['type'] = this.type;
        data['updated_at'] = this.updated_at;
        data['vechicle_identification_num'] = this.vechicle_identification_num;
        data['vechicle_name'] = this.vechicle_name;

        return data;
    }
}