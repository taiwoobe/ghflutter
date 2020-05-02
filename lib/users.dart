class User {
  final String login;
  final String avatar;
  User(this.login, this.avatar) {
    if (login == null) {
      throw ArgumentError('Login of User cannot be null.');
    }
    if (avatar == null) {
      throw ArgumentError('Avatar of User cannot be null.');
    }
  }
}
