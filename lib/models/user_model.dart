class CoordinateModel {
  num? lat;
  num? lng;

  CoordinateModel({this.lat, this.lng});

  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}

class AddressModel {
  String? address;
  String? city;
  String? country;
  String? postalCode;
  String? state;
  String? stateCode;
  CoordinateModel? coordinates;

  AddressModel({this.state,
    this.address,
    this.city,
    this.coordinates,
    this.country,
    this.postalCode,
    this.stateCode});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        address: json['address'],
        postalCode: json['postalCode'],
        country: json['country'],
        city: json['city'],
        state: json['state'],
        stateCode: json['stateCode'],
        coordinates: CoordinateModel.fromJson(json['coordinates']));
  }
}

class HairModel {
  String? color;
  String? type;

  HairModel({this.type, this.color});

  factory HairModel.fromJson(Map<String, dynamic> json) {
    return HairModel(
      color: json['color'],
      type: json['type'],
    );
  }
}

class BankModel {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  BankModel({this.cardExpire,
    this.cardNumber,
    this.cardType,
    this.currency,
    this.iban});

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      cardExpire: json['cardExpire'],
      iban: json['iban'],
      cardNumber: json['cardNumber'],
      cardType: json['cardType'],
      currency: json['currency'],
    );
  }
}

class CompanyModel {
  String? department;
  String? name;
  String? title;
  AddressModel? address;

  CompanyModel({this.address, this.title, this.name, this.department});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
        title: json['title'],
        name: json['name'],
        department: json['department'],
        address: AddressModel.fromJson(json['address']));
  }
}

class CryptoModel {
  String? coin;
  String? network;
  String? wallet;

  CryptoModel({this.network, this.coin, this.wallet});

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      coin: json['coin'],
      network: json['network'],
      wallet: json['wallet'],
    );
  }
}

class UserModel {
  AddressModel? address;
  int? age;
  BankModel? bank;
  String? birthDate;
  String? bloodGroup;
  CompanyModel? company;
  CryptoModel? crypto;
  String? ein;
  String? email;
  String? eyeColor;
  String? firstName;
  String? gender;
  HairModel? hair;
  num? height;
  int? id;
  String? image;
  String? ip;
  String? lastName;
  String? macAddress;
  String? maidenName;
  String? password;
  String? phone;
  String? role;
  String? ssn;
  String? university;
  String? userAgent;
  String? username;
  num? weight;

  UserModel({this.address,
    this.weight,
    this.id,
    this.height,
    this.email,
    this.password,
    this.phone,
    this.age,
    this.bank,
    this.birthDate,
    this.bloodGroup,
    this.company,
    this.crypto,
    this.ein,
    this.eyeColor,
    this.firstName,
    this.gender,
    this.hair,
    this.image,
    this.ip,
    this.lastName,
    this.macAddress,
    this.maidenName,
    this.role,
    this.ssn,
    this.university,
    this.userAgent,
    this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      address: AddressModel.fromJson(json['address']),
      id: json['id'],
      height: json['height'],
      macAddress: json['macAddress'],
      lastName: json['lastName'],
      ip: json['ip'],
      image: json['image'],
      gender: json['gender'],
      firstName: json['firstName'],
      eyeColor: json['eyeColor'],
      ein: json['ein'],
      bloodGroup: json['bloodGroup'],
      maidenName: json['maidenName'],
      userAgent: json['userAgent'],
      university: json['university'],
      ssn: json['ssn'],
      role: json['role'],
      birthDate: json['birthDate'],
      age: json['age'],
      password: json['password'],
      phone: json['phone'],
      email: json['email'],
      weight: json['weight'],
      username: json['username'],
      bank: BankModel.fromJson(json['bank']),
      company: CompanyModel.fromJson(json['company']),
      crypto: CryptoModel.fromJson(json['crypto']),
      hair: HairModel.fromJson(json['hair']),
    );
  }
}

class UserDataModel {
  int?limit;
  int?skip;
  int?total;
  List<UserModel>? users;

  UserDataModel({this.total, this.skip, this.limit, this.users});

  factory UserDataModel.fromJson(Map<String, dynamic>json){
    List<UserModel> allUser = [];
    for (Map<String, dynamic> eachUser in json['users']) {
      allUser.add(UserModel.fromJson(eachUser));
    }
    return UserDataModel(
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
        users: allUser
    );
  }
}
