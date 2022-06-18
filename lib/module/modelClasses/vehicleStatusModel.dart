class VehicleStatusList {
    List<Data>? data;
    String? message;
    int? success;

    VehicleStatusList({this.data, this.message, this.success});

    factory VehicleStatusList.fromJson(Map<String, dynamic> json) {
        return VehicleStatusList(
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
    int? id;
    String? status;
    String? vechicle_status;

    Data({this.id, this.status, this.vechicle_status});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            id: json['id'],
            status: json['status'],
            vechicle_status: json['vechicle_status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['status'] = this.status;
        data['vechicle_status'] = this.vechicle_status;
        return data;
    }
}