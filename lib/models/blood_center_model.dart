class BloodCenterModel {
  final String uuid;
  final String name;
  final String picture;
  final String address;
  final String phone;
  final int requested;
  final int collected;

  BloodCenterModel(this.uuid, this.name, this.picture, this.address, this.phone,
      this.requested, this.collected);

  factory BloodCenterModel.fromJson(Map<String, dynamic> json) {
    return BloodCenterModel(
      json['uuid'],
      json['name'],
      json['picture'],
      json['address'],
      json['phone'],
      json['requested'],
      json['collected'],
    );
  }
}
