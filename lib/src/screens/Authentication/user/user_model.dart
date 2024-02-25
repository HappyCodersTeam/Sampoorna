


import 'package:cloud_firestore/cloud_firestore.dart';

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
  String get fullName => '$name';
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
static UserModel empty() => UserModel(id: '', name: '', email: '', phoneNumber: '', DOB: '', gender: '', disability: '', profilePicture: '', disabilityCerti: '');
//   factory method to creat a usermodel from firebase doc snapshot
factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data()!=null)
      {
        final data =document.data()!;
        return UserModel(
          id: document.id,
          name: data['Fullname'] ?? '',
          email: data['Email'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          DOB: data['DOB'] ?? '',
          gender: data['Gender'] ?? '',
          disability: data['Disability'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '',
          disabilityCerti: data['DisabilityCertificate'] ?? '',
        );

      }
    else{
      return UserModel.empty();
    }

  }


}