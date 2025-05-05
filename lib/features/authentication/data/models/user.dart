class User {
  final String? firstName;
  final String? name;
  final String? secondName;
  final int? userId;
  final String? email;
  final String? nationalId;
  final String? phoneNumber;
  final String? maritalStatus;
  final String? birthdate;
  final String? religion;
  final String? gender;
  final int? age;
  final String? medicalCompany;
  final String? id;
  final String? idType;
  final String? address;
  final String? city;
  final String? area;
  final String? street;
  final String? phone;
  final String? buildingNumber;
  final String? password;
  final String? confirmPassword;

  User({
     this.firstName,
     this.secondName,
     this.nationalId,
     this.name,
     this.password,
     this.userId,
     this.phone,
     this.confirmPassword,
     this.email,
     this.phoneNumber,
     this.maritalStatus,
     this.birthdate,
     this.religion,
     this.gender,
     this.age,
     this.medicalCompany,
     this.id,
     this.idType,
     this.address,
     this.city,
     this.area,
     this.street,
     this.buildingNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json['firstName'] ?? '',
    secondName: json['secondName'] ?? '',
    userId: json['userId'] is int ? json['userId'] : int.tryParse('${json['userId']}') ?? 0,
    nationalId: json['national_id'] ?? '',
    name: json['name'] ?? '',
    confirmPassword: json['confirmPassword'] ?? '',
    password: json['password'] ?? '',
    email: json['email'] ?? '',
    phoneNumber: json['phoneNumber'] ?? '',
    phone: json['phone'] ?? '',
    maritalStatus: json['maritalStatus'] ?? '',
    birthdate: json['birthdate'] ?? '',
    religion: json['religion']?.trim() ?? '',
    gender: json['gender'] ?? '',
    age: json['age'] is int ? json['age'] : int.tryParse('${json['age']}') ?? 0,
    medicalCompany: json['medicalCompany'] ?? '',
    id: json['id'] ?? '',
    idType: json['idType'] ?? '',
    address: json['address'] ?? '',
    city: json['city'] ?? '',
    area: json['area'] ?? '',
    street: json['street'] ?? '',
    buildingNumber: json['buildingNumber'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'secondName': secondName,
    'userId': userId,
    'email': email,
    'name': name,
    'phone': phone,
    'password': password,
    'confirmPassword': confirmPassword,
    'phoneNumber': phoneNumber,
    'maritalStatus': maritalStatus,
    'national_id': nationalId,
    'birthdate': birthdate,
    'religion': religion,
    'gender': gender,
    'age': age,
    'medicalCompany': medicalCompany,
    'id': id,
    'idType': idType,
    'address': address,
    'city': city,
    'area': area,
    'street': street,
    'buildingNumber': buildingNumber,
  };
}
