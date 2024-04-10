class UserModel {
  final String uid;
  final List<String> tweets;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime createdAt;

  UserModel(
      {required this.uid,
      required this.tweets,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.createdAt});
}
