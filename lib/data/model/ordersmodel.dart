class OrdersModel {
  int? ordersId;
  int? ordersUsersid;
  int? ordersAddress;
  int? ordersType;
  int? ordersPricedelivery;
  int? ordersPrice;
  int? ordersTotalprice;
  int? ordersCoupon;
  int? ordersRating;
  String? ordersRatingnote;
  int? ordersPaymentsmethod;
  int? ordersStatus;
  String? ordersDate;
  int? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressDetails;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersRating,
      this.ordersRatingnote,
      this.ordersPaymentsmethod,
      this.ordersStatus,
      this.ordersDate,
      this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressDetails});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersRatingnote = json['orders_ratingnote'];
    ordersPaymentsmethod = json['orders_paymentsmethod'];
    ordersStatus = json['orders_status'];
    ordersDate = json['orders_date'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressDetails = json['address_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_rating'] = this.ordersRating;
    data['orders_ratingnote'] = this.ordersRatingnote;
    data['orders_paymentsmethod'] = this.ordersPaymentsmethod;
    data['orders_status'] = this.ordersStatus;
    data['orders_date'] = this.ordersDate;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_details'] = this.addressDetails;
    return data;
  }
}
