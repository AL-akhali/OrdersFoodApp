class SupriseModel {
  int? surpriseId;
  String? surpriseTitle;
  String? surpriseTitleAr;
  String? surpriseBody;
  String? surpriseBodyAr;
  String? surpriseImage;
  int? surpriseDeliverytime;

  SupriseModel(
      {this.surpriseId,
      this.surpriseTitle,
      this.surpriseTitleAr,
      this.surpriseBody,
      this.surpriseBodyAr,
      this.surpriseImage,
      this.surpriseDeliverytime});

  SupriseModel.fromJson(Map<String, dynamic> json) {
    surpriseId = json['surprise_id'];
    surpriseTitle = json['surprise_title'];
    surpriseTitleAr = json['surprise_title_ar'];
    surpriseBody = json['surprise_body'];
    surpriseBodyAr = json['surprise_body_ar'];
    surpriseImage = json['surprise_image'];
    surpriseDeliverytime = json['surprise_deliverytime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surprise_id'] = this.surpriseId;
    data['surprise_title'] = this.surpriseTitle;
    data['surprise_title_ar'] = this.surpriseTitleAr;
    data['surprise_body'] = this.surpriseBody;
    data['surprise_body_ar'] = this.surpriseBodyAr;
    data['surprise_image'] = this.surpriseImage;
    data['surprise_deliverytime'] = this.surpriseDeliverytime;
    return data;
  }
}
