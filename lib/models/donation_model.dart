class DonationModel {
  final String uuid;
  final String status;
  final String date;
  final String bloodCenterName;

  DonationModel(this.uuid, this.status, this.date, this.bloodCenterName);

  factory DonationModel.fromJson(Map<String, dynamic> json) {
    return DonationModel(
        json['uuid'], json['status'], json['date'], json['bloodCenterName']);
  }
}
