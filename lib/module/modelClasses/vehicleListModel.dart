class VehicleList {
    List<Data>? data;
    String? message;
    int? success;

    VehicleList({this.data, this.message, this.success});

    factory VehicleList.fromJson(Map<String, dynamic> json) {
        return VehicleList(
            data: json['`data`'] != null ? (json['`data`']).map((i) => Data.fromJson(i)).toList() : null,
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
    String? amount;
    String? created_at;
    String? current_date;
    String? updated_at;
    int? vechicle_id;
    String? vechicle_name;

    Data({this.amount, this.created_at, this.current_date, this.updated_at, this.vechicle_id, this.vechicle_name});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            amount: json['amount'],
            created_at: json['created_at'],
            current_date: json['current_date'],
            updated_at: json['updated_at'],
            vechicle_id: json['vechicle_id'],
            vechicle_name: json['vechicle_name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['amount'] = this.amount;
        data['created_at'] = this.created_at;
        data['current_date'] = this.current_date;
        data['updated_at'] = this.updated_at;
        data['vechicle_id'] = this.vechicle_id;
        data['vechicle_name'] = this.vechicle_name;
        return data;
    }
}