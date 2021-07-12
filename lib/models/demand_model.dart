class DemandModel {
  final String bloodType;
  final int requested;
  final int collected;

  DemandModel(this.bloodType, this.requested, this.collected);

  factory DemandModel.fromJson(Map<String, dynamic> json) {
    return DemandModel(json['bloodType'], json['requested'], json['collected']);
  }
}
