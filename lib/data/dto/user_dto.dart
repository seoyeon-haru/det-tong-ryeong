class UserDto {
  final String nickNM;
  final String uid;
  final String photoURL;

  UserDto({
    required this.nickNM,
    required this.uid,
    required this.photoURL,
  });

  UserDto.fromJson(Map<String, dynamic> map)
    : this(
        nickNM: map["nickNM"],
        uid: map["uid"],
        photoURL: map["photoURL"],
      );

  Map<String, dynamic> toJson() {
    return {
      "nickNM": nickNM,
      "uid": uid,
      "photoURL": photoURL,
    };
  }
}
