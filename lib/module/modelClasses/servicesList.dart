class ServicesList {
    List<Data>? data;
    String? message;
    int? success;

    ServicesList({this.data, this.message, this.success});

    factory ServicesList.fromJson(Map<String, dynamic> json) {
        return ServicesList(
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
    String? created_at;
    String? customer_name;
    String? customer_no;
    String? service_change;
    int? service_id;
    String? service_status;
    String? services;
    String? status;
    String? updated_at;
    String? vechicle_identification_num;
    String? vechicle_name;

    Data({this.created_at, this.customer_name, this.customer_no, this.service_change, this.service_id, this.service_status, this.services, this.status, this.updated_at, this.vechicle_identification_num, this.vechicle_name});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            created_at: json['created_at'],
            customer_name: json['customer_name'],
            customer_no: json['customer_no'],
            service_change: json['service_change'],
            service_id: json['service_id'],
            service_status: json['service_status'],
            services: json['services'],
            status: json['status'],
            updated_at: json['updated_at'],
            vechicle_identification_num: json['vechicle_identification_num'],
            vechicle_name: json['vechicle_name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['customer_name'] = this.customer_name;
        data['customer_no'] = this.customer_no;
        data['service_change'] = this.service_change;
        data['service_id'] = this.service_id;
        data['service_status'] = this.service_status;
        data['services'] = this.services;
        data['status'] = this.status;
        data['updated_at'] = this.updated_at;
        data['vechicle_identification_num'] = this.vechicle_identification_num;
        data['vechicle_name'] = this.vechicle_name;
        return data;
    }
}