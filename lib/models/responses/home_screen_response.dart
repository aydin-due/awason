class HomeScreenResponse {
  String? status;
  String? message;
  HomeInfo? data;

  HomeScreenResponse({this.status, this.message, this.data});

  HomeScreenResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? HomeInfo.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class HomeInfo {
  int? weeklyBalance;
  int? weeklyOrders;
  int? todayOrders;

  HomeInfo({this.weeklyBalance, this.weeklyOrders, this.todayOrders});

  HomeInfo.fromJson(Map<String, dynamic> json) {
    weeklyBalance = json['weeklyBalance'];
    weeklyOrders = json['weeklyOrders'];
    todayOrders = json['todayOrders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['weeklyBalance'] = weeklyBalance;
    data['weeklyOrders'] = weeklyOrders;
    data['todayOrders'] = todayOrders;
    return data;
  }
}
