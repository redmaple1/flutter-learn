class ClockInRes {
  int code;
  String message;
  bool status;
  Data data;

  ClockInRes({this.code, this.message, this.status, this.data});

  ClockInRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String parentDeps;
  int date;
  String msg;

  Data({this.parentDeps, this.date, this.msg});

  Data.fromJson(Map<String, dynamic> json) {
    parentDeps = json['parentDeps'];
    date = json['date'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parentDeps'] = this.parentDeps;
    data['date'] = this.date;
    data['msg'] = this.msg;
    return data;
  }
}