class VehicleAllottedMatchList {
    List<dynamic>? data;
    String? message;
    int? success;

    VehicleAllottedMatchList({this.data, this.message, this.success});

    factory VehicleAllottedMatchList.fromJson(Map<String, dynamic> json) {
        return VehicleAllottedMatchList(
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
            data['`data`'] = this.data?.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Data {
    String? battery_name;
    String? color_name;
    String? created_at;
    String? dlt_status;
    String? filename;
    int? id;
    String? model_name;
    String? motor_num;
    String? price;
    String? registered_date;
    String? specification;
    String? status;
    String? updated_at;
    String? vechicle_identification_num;
    String? vechicle_name;

    Data({this.battery_name, this.color_name, this.created_at, this.dlt_status, this.filename, this.id, this.model_name, this.motor_num, this.price, this.registered_date, this.specification, this.status, this.updated_at, this.vechicle_identification_num, this.vechicle_name});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            battery_name: json['battery_name'],
            color_name: json['color_name'],
            created_at: json['created_at'],
            dlt_status: json['dlt_status'],
            filename: json['filename'],
            id: json['id'],
            model_name: json['model_name'],
            motor_num: json['motor_num'],
            price: json['price'],
            registered_date: json['registered_date'],
            specification: json['specification'],
            status: json['status'],
            updated_at: json['updated_at'],
            vechicle_identification_num: json['vechicle_identification_num'],
            vechicle_name: json['vechicle_name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['battery_name'] = this.battery_name;
        data['color_name'] = this.color_name;
        data['created_at'] = this.created_at;
        data['dlt_status'] = this.dlt_status;
        data['filename'] = this.filename;
        data['id'] = this.id;
        data['model_name'] = this.model_name;
        data['motor_num'] = this.motor_num;
        data['price'] = this.price;
        data['registered_date'] = this.registered_date;
        data['specification'] = this.specification;
        data['status'] = this.status;
        data['updated_at'] = this.updated_at;
        data['vechicle_identification_num'] = this.vechicle_identification_num;
        data['vechicle_name'] = this.vechicle_name;
        return data;
    }
}