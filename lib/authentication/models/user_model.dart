

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phone;
  String profilePicture;
  String academicLevel;
  String grade;
  String stemSchool;
  String gender;
  String birthDate;
  final DateTime? registrationDate;

  /// Constructor for UserModel.
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phone,
    required this.profilePicture,
    required this.academicLevel,
    required this.grade,
    required this.stemSchool,
    this.gender = '',
    this.birthDate = '',
    this.registrationDate,
  });

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phone);

  static List<String> nameParts(String fullName) => fullName.split(" ");

  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phone: '',
        profilePicture: '',
        academicLevel: '',
        grade: '',
        stemSchool: '',
        gender: '',
        birthDate: '',
      );

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? phone,
    String? profilePicture,
    String? academicLevel,
    String? grade,
    String? stemSchool,
    String? gender,
    String? birthDate,
  }) {
    return UserModel(
      id: id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username,
      email: email,
      phone: phone ?? this.phone,
      profilePicture: profilePicture ?? this.profilePicture,
      academicLevel: academicLevel ?? this.academicLevel,
      grade: grade ?? this.grade,
      stemSchool: stemSchool ?? this.stemSchool,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      registrationDate: registrationDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phone': phone,
      'profilePicture': profilePicture,
      'academicLevel': academicLevel,
      'grade': grade,
      'stemSchool': stemSchool,
      'gender': gender,
      'birthDate': birthDate,
      'registrationDate': registrationDate != null
          ? Timestamp.fromDate(registrationDate!)
          : FieldValue.serverTimestamp(),
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        phone: data['phone'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
        academicLevel: data['academicLevel'] ?? '',
        grade: data['grade'] ?? '',
        stemSchool: data['stemSchool'] ?? '',
        gender: data['gender'] ?? '',
        birthDate: data['birthDate'] ?? '',
        registrationDate: (data['registrationDate'] as Timestamp?)?.toDate(),
      );
    }
    return UserModel.empty();
  }
}