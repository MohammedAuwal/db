abstract class Failure {
  final String message;
  const Failure({required this.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super(message: 'No internet connection');
}

class AuthFailure extends Failure {
  const AuthFailure({required super.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class UploadFailure extends Failure {
  const UploadFailure({required super.message});
}

class ProcessingFailure extends Failure {
  const ProcessingFailure({required super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}
