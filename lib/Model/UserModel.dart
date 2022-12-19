
class UserModel {
  String fullName;
  String nickName;
  String phoneNumber;
  String dateOfBirth;
  String address;
  String gender;
  String image;
  String email;
  String password;

  UserModel({
    required this.fullName,
    required this.nickName,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.address,
    required this.gender,
    required this.image,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map data){
    return UserModel(fullName: data['fullName'],
        nickName: data['nickName'],
        phoneNumber: data['phoneNumber'],
        dateOfBirth: data['dateOfBirth'],
        address: data['address'],
        gender: data['gender'],
      image: data['image'],
      email: data['email'],
      password: data['password'],

    );
  }

  Map<String,String> toJson(){
    return {
      "fullName": fullName ,
      "nickName": nickName ,
      "phoneNumber": phoneNumber ,
      "dateOfBirth": dateOfBirth ,
      "address": address ,
      "gender": gender ,
      "image": image,
      "email": email,
      "password": password,
    };
  }
}
