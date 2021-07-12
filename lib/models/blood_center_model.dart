import 'package:hemobile/models/blood_types_enum.dart';

class BloodCenterModel {
  final BloodType bloodTypes;
  final String uuid;
  final String name;
  final String picture;
  final String address;
  final String phone;
  final int requested;
  final int collected;

  BloodCenterModel(this.bloodTypes, this.uuid, this.name, this.picture,
      this.address, this.phone, this.requested, this.collected);
}
