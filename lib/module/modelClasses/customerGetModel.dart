class CustomerGetList {
    Data? data;
    String? message;
    int? success;

    CustomerGetList({this.data, this.message, this.success});

    factory CustomerGetList.fromJson(Map<String, dynamic> json) {
        return CustomerGetList(
            data: json['data'] != null ? Data.fromJson(json['data']) : null,
            message: json['message'],
            success: json['success'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['success'] = this.success;
        if (this.data != null) {
            data['data'] = this.data?.toJson();
        }
        return data;
    }
}

class Data {
    String? contact_no;
    String? created_at;
    String? customer_email;
    String? customer_name;
    String? customer_no;
    String? dealer_name;
    String? email;
    String? motor_num;
    String? vechicle_identification_num;

    Data({this.contact_no, this.created_at, this.customer_email, this.customer_name, this.customer_no, this.dealer_name, this.email, this.motor_num, this.vechicle_identification_num});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            contact_no: json['contact_no'],
            created_at: json['created_at'],
            customer_email: json['customer_email'],
            customer_name: json['customer_name'],
            customer_no: json['customer_no'],
            dealer_name: json['dealer_name'],
            email: json['email'],
            motor_num: json['motor_num'],
            vechicle_identification_num: json['vechicle_identification_num'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['contact_no'] = this.contact_no;
        data['created_at'] = this.created_at;
        data['customer_email'] = this.customer_email;
        data['customer_name'] = this.customer_name;
        data['customer_no'] = this.customer_no;
        data['dealer_name'] = this.dealer_name;
        data['email'] = this.email;
        data['motor_num'] = this.motor_num;
        data['vechicle_identification_num'] = this.vechicle_identification_num;
        return data;
    }
}