// ignore_for_file: prefer_typing_uninitialized_variables

class NetworkException implements Exception {
  final _message;
  final _prefix;

  NetworkException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends NetworkException {
  FetchDataException([String? message]) : super(message, "Error: ");
}

class BadRequestException extends NetworkException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}
