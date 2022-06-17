class StateList {
    List<dynamic>? data;
    String? message;
    int? success;

    StateList({this.data, this.message, this.success});

    factory StateList.fromJson(Map<String, dynamic> json) {
        return StateList(
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
    int? state_id;
    String? state_name;
    String? status;

    Data({this.state_id, this.state_name, this.status});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            state_id: json['state_id'],
            state_name: json['state_name'],
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['state_id'] = this.state_id;
        data['state_name'] = this.state_name;
        data['status'] = this.status;
        return data;
    }
}