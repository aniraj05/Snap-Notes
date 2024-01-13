// login exception

class UserNotFoundException implements Exception {}

class WrongPasswordException implements Exception {}

// register exception

class WeakPasswordException implements Exception {}

class EmailAlreadyInUseException implements Exception {}

class InvalidEmailException implements Exception {}

// generic exception

class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}