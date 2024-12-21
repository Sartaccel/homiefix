class Address {
  final String firstBox;
  final String phoneNumber;
  final String pinCode;
  final String homeAddress;
  final String town;
  final String nearby;
  final String district;
  final String state;

  Address({
    required this.firstBox,
    required this.phoneNumber,
    required this.pinCode,
    required this.homeAddress,
    required this.town,
    required this.nearby,
    required this.district,
    required this.state,
  });

  
  Map<String, dynamic> toMap() {
    return {
      'firstBox': firstBox,
      'phoneNumber': phoneNumber,
      'pinCode': pinCode,
      'homeAddress': homeAddress,
      'town': town,
      'nearby': nearby,
      'district': district,
      'state': state,
    };
  }

  // Convert Map to Address
  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      firstBox: map['firstBox'],
      phoneNumber: map['phoneNumber'],
      pinCode: map['pinCode'],
      homeAddress: map['homeAddress'],
      town: map['town'],
      nearby: map['nearby'],
      district: map['district'],
      state: map['state'],
    );
  }
}
