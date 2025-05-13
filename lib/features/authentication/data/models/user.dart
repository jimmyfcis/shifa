class User {
  final String? name;
  //act AS Patient ID for shifa operation
  final String? userId;
  final String? email;
  final String? nationalId;
  final String? phoneNumber;
  final String? maritalStatus;
  final String? birthdate;
  final String? religion;
  final String? gender;
  final int? age;
  final String? medicalCompany;
  //user id for the app
  final String? id;
  final String? idType;
  final String? type;
  final String? address;
  final String? patientID;
  final String? city;
  final String? area;
  final String? street;
  final String? buildingNumber;
  final String? password;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? image;
  final String? confirmPassword;

  User({
    this.nationalId,
    this.name,
    this.password,
    this.userId,
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
    this.type,
    this.patientID,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json['userId']?? "",
        nationalId: json['national_id'] ?? '',
        name: json['name'] ?? '',
        confirmPassword: json['confirmPassword'] ?? '',
        password: json['password'] ?? '',
        type: json['type'] ?? '',
        status: json['status'] ?? '',
        createdAt: json['created_at'] ?? '',
        updatedAt: json['updated_at'] ?? '',
        image: json['image'] ?? '',
        patientID: json['PatientID'] ?? '',
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
        'userId': userId,
        'email': email,
        'name': name,
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
        'type': type,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'image': image,
        'status': status,
        'PatientID': patientID,
      };
}
