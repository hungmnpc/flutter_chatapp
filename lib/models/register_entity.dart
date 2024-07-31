class RegisterEntity {
  String email;

  String fullName;

  String password;

  RegisterEntity(this.email, this.fullName, this.password);

  @override
  String toString() {
    // TODO: implement toString
    return 'RegisterEntity(email: $email, fullName: $fullName, password: $password)';
  }
}
