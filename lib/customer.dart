class customer {
  String? id;
  String? longitude;
  String? addressType;
  String? mobile;
  String? name;

  customer({this.id, this.longitude, this.addressType, this.mobile, this.name});

  customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    longitude = json['longitude'];
    addressType = json['address_type'];
    mobile = json['mobile'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['longitude'] = this.longitude;
    data['address_type'] = this.addressType;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    return data;
  }
}