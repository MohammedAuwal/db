class AppException implements Exception {
  final String message;
  final String? code;

  const AppException({required this.message, this.code});

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  const NetworkException({super.message = 'No internet connection'});
}

class AuthException extends AppException {
  const AuthException({required super.message, super.code});
}

class UploadException extends AppException {
  const UploadException({required super.message});
}

class ProcessingException extends AppException {
  const ProcessingException({required super.message});
}

class StorageException extends AppException {
  const StorageException({required super.message});
}

class FileSizeException extends AppException {
  const FileSizeException()
      : super(message: 'File size exceeds the 200MB limit');
}

class UnsupportedFormatException extends AppException {
  const UnsupportedFormatException()
      : super(message: 'Unsupported file format');
}
