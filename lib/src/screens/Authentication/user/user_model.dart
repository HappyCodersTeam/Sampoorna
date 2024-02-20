
class UserModel {
  final String id;
  String name;
  final String email;
  String phoneNumber;
  String DOB;
  String gender;
  String disability;
  String profilePicture;
  String disabilityCerti;

  // constructor
  UserModel({
    required this.id,
    required this.name
    , required this.email,
    required this.phoneNumber,
    required this.DOB,
    required this.gender,
    required this.disability,
    required this.profilePicture,
    required this.disabilityCerti,});

  // helper func to get name
//convert model to JSON for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'Fullname': name,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'DOB': DOB,
      'Gender': gender,
      'Disability': disability,
      'ProfilePicture': profilePicture,
      'DisabilityCertificate': disabilityCerti,
    };
  }
}