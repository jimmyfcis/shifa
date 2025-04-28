class User {
  final String firstName;
  final String secondName;
  final String userId;
  final String email;
  final String phoneNumber;
  final String maritalStatus;
  final String birthdate;
  final String religion;
  final String gender;
  final int age;
  final String medicalCompany;
  final String id;
  final String idType;
  final String address;
  final String city;
  final String area;
  final String street;
  final String buildingNumber;

  User({
    required this.firstName,
    required this.secondName,
    required this.userId,
    required this.email,
    required this.phoneNumber,
    required this.maritalStatus,
    required this.birthdate,
    required this.religion,
    required this.gender,
    required this.age,
    required this.medicalCompany,
    required this.id,
    required this.idType,
    required this.address,
    required this.city,
    required this.area,
    required this.street,
    required this.buildingNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json['firstName'] ?? '',
    secondName: json['secondName'] ?? '',
    userId: json['userId'] ?? '',
    email: json['email'] ?? '',
    phoneNumber: json['phoneNumber'] ?? '',
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
    'phoneNumber': phoneNumber,
    'maritalStatus': maritalStatus,
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
