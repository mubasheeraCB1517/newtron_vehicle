class VehicleRegistrationList {
    List<dynamic>? data;
    String? message;
    int? success;

    VehicleRegistrationList({this.data, this.message, this.success});

    factory VehicleRegistrationList.fromJson(Map<String, dynamic> json) {
        return VehicleRegistrationList(
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
            data['data'] = this.data?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Data {
    String? amount;
    int? battery_id;
    String? battery_name;
    int? color_id;
    String? color_name;
    String? created_at;
    String? current_date;
    String? dealer_price;
    String? filename;
    int? id;
    String? motor_num;
    String? price;
    String? registered_date;
    String? specification;
    String? type;
    String? updated_at;
    int? vechicle_id;
    String? vechicle_identification_num;
    String? vechicle_name;

    Data({this.amount, this.battery_id, this.battery_name, this.color_id, this.color_name, this.created_at, this.current_date, this.dealer_price, this.filename, this.id, this.motor_num, this.price, this.registered_date, this.specification, this.type, this.updated_at, this.vechicle_id, this.vechicle_identification_num, this.vechicle_name});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            amount: json['amount'],
            battery_id: json['battery_id'],
            battery_name: json['battery_name'],
            color_id: json['color_id'],
            color_name: json['color_name'],
            created_at: json['created_at'],
            current_date: json['current_date'] ,
            dealer_price: json['dealer_price'],
            filename: json['filename'],
            id: json['id'],
            motor_num: json['motor_num'],
            price: json['price'],
            registered_date: json['registered_date'],
            specification: json['specification'],
            type: json['type'],
            updated_at: json['updated_at'],
            vechicle_id: json['vechicle_id'],
            vechicle_identification_num: json['vechicle_identification_num'],
            vechicle_name: json['vechicle_name'] ,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['amount'] = this.amount;
        data['battery_id'] = this.battery_id;
        data['battery_name'] = this.battery_name;
        data['color_id'] = this.color_id;
        data['color_name'] = this.color_name;
        data['created_at'] = this.created_at;
        data['dealer_price'] = this.dealer_price;
        data['filename'] = this.filename;
        data['id'] = this.id;
        data['motor_num'] = this.motor_num;
        data['price'] = this.price;
        data['registered_date'] = this.registered_date;
        data['specification'] = this.specification;
        data['type'] = this.type;
        data['updated_at'] = this.updated_at;
        data['vechicle_id'] = this.vechicle_id;
        data['vechicle_identification_num'] = this.vechicle_identification_num;
        if (this.current_date != null) {
            data['current_date'] = this.current_date;
        }
        if (this.vechicle_name != null) {
            data['vechicle_name'] = this.vechicle_name;
        }
        return data;
    }
}