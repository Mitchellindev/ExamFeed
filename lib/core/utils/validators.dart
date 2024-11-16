String? dotValidator(String? value) {
  if (value != null && !value.contains('.') && !value.contains('@')) {
    return 'Invalid email address';
  }
  // check if theres a . after the @
  if (value != null && value.contains('@')) {
    final split = value.split('@');
    if (split[1].contains('.')) {
      return null;
    }
    return 'Invalid email address';
  }
  // check if theres any character after the last .
  if (value != null && value.contains('.')) {
    final split = value.split('.');
    if (split[split.length - 1].isEmpty) {
      return 'Invalid email address';
    }
  }
  return null;
}

String? equalToValidator(String? value, {String? value2}) {
  if (value != value2) {
    return 'Passwords do not match';
  }
  return null;
}
