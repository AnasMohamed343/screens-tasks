bool isValidEmail(String email) {
  // implement email validation logic here
  // for example:
  return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
      .hasMatch(email);
}
