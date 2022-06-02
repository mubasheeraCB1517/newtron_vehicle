class BatteryList {
    List<Data>?data;
    String? message;
    int? success;

    BatteryList({this.data, this.message, this.success});

    factory BatteryList.fromJson(Map<String, dynamic> json) {
        return BatteryList(
            data: json['`data`'] != null ? (json['`data`'] as List).map((i) => Data.fromJson(i)).toList() : null,
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
    String? battery;
    int? battery_id;
    String? created_at;
    String? dealer_price;
    String? price;
    String? specification;
    String? updated_at;
    String? vechicle_name;

    Data({this.battery, this.battery_id, this.created_at, this.dealer_price, this.price, this.specification, this.updated_at, this.vechicle_name});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            battery: json['battery'],
            battery_id: json['battery_id'],
            created_at: json['created_at'],
            dealer_price: json['dealer_price'],
            price: json['price'],
            specification: json['specification'],
            updated_at: json['updated_at'],
            vechicle_name: json['vechicle_name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['battery'] = this.battery;
        data['battery_id'] = this.battery_id;
        data['created_at'] = this.created_at;
        data['dealer_price'] = this.dealer_price;
        data['price'] = this.price;
        data['specification'] = this.specification;
        data['updated_at'] = this.updated_at;
        if (this.vechicle_name != null) {
            data['vechicle_name'] = this.vechicle_name;
        }
        return data;
    }
}