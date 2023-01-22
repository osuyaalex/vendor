class VendorUserModels{
  final bool? approved;
  final String? businessName;
  final String? city;
  final String? country;
  final String? email;
  final String? phoneNo;
  final String? state;
  final String? storeImage;
  final String? taxNumber;
  final String? taxRegister;

  VendorUserModels(
      {
        required this.approved,
        required this.businessName,
        required this.city,
        required this.country,
        required this.email,
        required this.phoneNo,
        required this.state,
        required this.storeImage,
        required this.taxNumber,
        required this.taxRegister
      }
      );
  VendorUserModels.fromJson(Map<String, Object?> json):
        this(
        approved: json['approved']! as bool,
        businessName: json['businessName']! as String,
        city: json['city']! as String,
        country: json['country']! as String,
        email: json['email']! as String,
        phoneNo: json['phoneNo']! as String,
        state: json['state']! as String,
        storeImage: json['storeImage']! as String,
        taxNumber: json['taxNumber']! as String,
        taxRegister: json['taxRegister'] as String,
      );
  Map<String, Object?>toJson(){
    return{
      'businessName': businessName,
      'email':email,
      'phone number': phoneNo,
      'country': country,
      'state':state,
      'city': city,
      'tax options': taxRegister,
      'tax number': taxNumber,
      'image': storeImage,
      'approved':approved
    };
  }
}