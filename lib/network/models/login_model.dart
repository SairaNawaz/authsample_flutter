class LoginModel {
  bool? status;
  String? message;
  Data? data;

  // bool? status;
  // String? message;
  // Data? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.mock() {
    status = true;
    message = "Success";
    data = Data(
        user: User(name: "System Administrator", email: "admin@example.com"),
        students: [
          Students(status: "Active", student: "Student 1"),
          Students(status: "Active", student: "Student 2")
        ]);
  }

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  List<Students>? students;

  Data({this.user, this.students});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? userId;
  Null? isAdmin;
  String? email;
  String? password;
  String? name;
  String? mobile;
  String? roleId;
  String? isDeleted;
  String? createdBy;
  String? createdDtm;
  String? updatedBy;
  String? updatedDtm;

  User(
      {this.userId,
      this.isAdmin,
      this.email,
      this.password,
      this.name,
      this.mobile,
      this.roleId,
      this.isDeleted,
      this.createdBy,
      this.createdDtm,
      this.updatedBy,
      this.updatedDtm});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    isAdmin = json['isAdmin'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    mobile = json['mobile'];
    roleId = json['roleId'];
    isDeleted = json['isDeleted'];
    createdBy = json['createdBy'];
    createdDtm = json['createdDtm'];
    updatedBy = json['updatedBy'];
    updatedDtm = json['updatedDtm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['isAdmin'] = this.isAdmin;
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['roleId'] = this.roleId;
    data['isDeleted'] = this.isDeleted;
    data['createdBy'] = this.createdBy;
    data['createdDtm'] = this.createdDtm;
    data['updatedBy'] = this.updatedBy;
    data['updatedDtm'] = this.updatedDtm;
    return data;
  }
}

class Students {
  String? studentId;
  String? student;
  String? status;
  String? createdDtm;
  String? isDeleted;
  String? updatedBy;
  String? updatedDtm;
  String? createdBy;

  Students(
      {this.studentId,
      this.student,
      this.status,
      this.createdDtm,
      this.isDeleted,
      this.updatedBy,
      this.updatedDtm,
      this.createdBy});

  Students.fromJson(Map<String, dynamic> json) {
    studentId = json['studentId'];
    student = json['student'];
    status = json['status'];
    createdDtm = json['createdDtm'];
    isDeleted = json['isDeleted'];
    updatedBy = json['updatedBy'];
    updatedDtm = json['updatedDtm'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentId'] = this.studentId;
    data['student'] = this.student;
    data['status'] = this.status;
    data['createdDtm'] = this.createdDtm;
    data['isDeleted'] = this.isDeleted;
    data['updatedBy'] = this.updatedBy;
    data['updatedDtm'] = this.updatedDtm;
    data['createdBy'] = this.createdBy;
    return data;
  }
}
