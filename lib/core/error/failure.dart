
import 'package:equatable/equatable.dart';

import 'exception.dart';

/// This [Failure] class is created to reduce propagation
/// of errors such as SocketException to propagate to
/// the UI Layer. This class will hold the exceptions thrown
/// from the [Data Layer].
abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

/// [TooManyRequestFailure] is returned when API Endpoint
/// returns a 429 Too Many Request within a given time status code.
class TooManyRequestFailure extends Failure {}

/// [UnAuthrizedFailure] is returned when API Endpoint
/// returns a 401 User is not Authrized to make API request status code.
class UnAuthrizedFailure extends Failure {}

/// [ForbiddenFailure] is returned when API Endpoint
/// returns a 403 User is Forbid to make API request status code.
class ForbiddenFailure extends Failure {}

/// [RequestTimeOutFailure] is returned when API Endpoint
/// returns a 408 the API is not processed within given Time status code.
class RequestTimeOutFailure extends Failure {}

/// [MethodNotAllowedFailure] is returned when API Endpoint
/// returns a 405 the request is call with Wrong Method [GET,POST,...] status code.
class MethodNotAllowedFailure extends Failure {}

/// [InternalServerFailure] is returned when API Endpoint
/// returns a 500 Internal Server Error status code.
class InternalServerFailure extends Failure {}

/// [NotImplementedServerFailure] is returned when API Endpoint
/// returns a 501 Not Implemented status code.
class NotImplementedServerFailure extends Failure {}

/// [NotFoundFailure] is returned when API Endpoint
/// returns a 404 Not Found status code.
class NotFoundFailure extends Failure {}

//Data Not Found
class DataNotFoundFailure extends Failure {}

/// [ServerUnavailableFailure] is returned when API Endpoint
/// returns a 503 Server unavailable status code.
class ServerUnavailableFailure extends Failure {}

/// [BadGatewayFailure] is returned when API Endpoint
/// returns a 502 Bad Gateway status code.
class BadGatewayFailure extends Failure {}

/// [CacheFailure] is returned when there's
/// no Cache Found in the device.
class CacheFailure extends Failure {}

/// [ConflictFailure] is returned when API Endpoint
/// returns a 409 Conflict Status Code.
class ConflictFailure extends Failure {}

/// [RequestEntityTooLargeFailure] is returned when API Endpoint
/// returns a 413 .
class RequestEntityTooLargeFailure extends Failure {}

/// [NoInternetConnectionFailure] is returned when there's
/// no active internet connection.
class NoInternetConnectionFailure extends Failure {}

/// [BadRequestFailure] is returned when API Endpoint
/// returns a 400 Bad request Status Code.
class BadRequestFailure extends Failure {
  BadRequestFailure({this.message});

  final String? message;

  @override
  List<Object?> get props => <Object?>[message];
}

/// [GatewayTimeOutFailure] is returned when API Endpoint
/// returns a 504 Gateway Time out.
class GatewayTimeOutFailure extends Failure {}

/// [ParseJsonFailure] is returned when Response body from API endpoint
/// is unable to be parsed into a dart object
class ParseJsonFailure extends Failure {}

class TypeErrorFailure extends Failure {}

/// Firebase Auth Log in Failures
class FirebaseAuthLogInFailedFailure extends Failure {}

class FirebaseAuthLogInInvalidEmailFailure extends Failure {}

class FirebaseAuthLogInUserDisabledFailure extends Failure {}

class FirebaseAuthLogInUserNotFoundFailure extends Failure {}

class FirebaseAuthLogInWrongPasswordFailure extends Failure {}

class FirebaseAuthLogInUnknownFailure extends Failure {}

class FirebaseAuthLogInTooManyRequestsFailure extends Failure {}

class FirebaseAuthLogInInvalidCredentialsFailure extends Failure {}

class FirebaseAuthForgetPasswordUserNotFoundFailure extends Failure {}

class FirebaseAuthForgetPasswordUnknownFailure extends Failure {}

class FirebaseAuthNetworkRequestFailedFailure extends Failure {}

class InvalidEmailFailure extends Failure {
  InvalidEmailFailure();
  @override
  List<Object?> get props => <Object?>[];
}

class WeakPasswordFailure extends Failure {
  WeakPasswordFailure();
  @override
  List<Object?> get props => <Object?>[];
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure();

  @override
  List<Object?> get props => <Object?>[];
}

class AuthAccountExistWithDifferentCredentialFailure extends Failure {
  AuthAccountExistWithDifferentCredentialFailure();
  @override
  List<Object?> get props => <Object?>[];
}

class AuthInvalidCredentialFailure extends Failure {
  AuthInvalidCredentialFailure();
  @override
  List<Object?> get props => <Object?>[];
}

class AuthInvalidVerificationCodeFailure extends Failure {
  AuthInvalidVerificationCodeFailure();
  @override
  List<Object?> get props => <Object?>[];
}

class AuthOperationNotAllowedFailure extends Failure {
  AuthOperationNotAllowedFailure();
  @override
  List<Object?> get props => <Object?>[];
}

class AuthUserDisabledFailure extends Failure {
  AuthUserDisabledFailure();
  @override
  List<Object?> get props => <Object?>[];
}

class AuthInvalidVerificationIdFailure extends Failure {
  AuthInvalidVerificationIdFailure();
  @override
  List<Object?> get props => <Object?>[];
}

class AuthEmailAlreadyInUseFailure extends Failure {
  AuthEmailAlreadyInUseFailure();
  @override
  List<Object?> get props => <Object?>[];
}

class AuthWrongPasswordFailure extends Failure {
  AuthWrongPasswordFailure();
  @override
  List<Object?> get props => <Object?>[];
}

class AuthUserNotFoundFailure extends Failure {
  AuthUserNotFoundFailure();
  @override
  List<Object?> get props => <Object?>[];
}

class SomethingWentWrongFailure extends Failure {
  SomethingWentWrongFailure();
  @override
  List<Object?> get props => [];
}

class UnknownFailure extends Failure {
  UnknownFailure();
  @override
  List<Object?> get props => [];
}

/// Sign up Firebase error

class FirebaseAuthSignUpInvalidEmailFailure extends Failure {
  FirebaseAuthSignUpInvalidEmailFailure();
  @override
  List<Object?> get props => <Object?>[];
}

class FirebaseAuthSignUpUserDisabledFailure extends Failure {
  FirebaseAuthSignUpUserDisabledFailure();
  @override
  List<Object?> get props => <Object?>[];
}

class FirebaseAuthSignUpUserNotFoundFailure extends Failure {
  FirebaseAuthSignUpUserNotFoundFailure();
  @override
  List<Object?> get props => <Object?>[];
}

class FirebaseAuthSignUpEmailAlreadyInUseFailure extends Failure {
  FirebaseAuthSignUpEmailAlreadyInUseFailure();
  @override
  List<Object?> get props => <Object?>[];
}

// ===========  EXCEPTIONS ================
Failure mapExceptionToFailures(Exception exception) {
  switch (exception) {
    case NoInternetConnectionException():
      return NoInternetConnectionFailure();
//404
    case NotFoundException():
      return NotFoundFailure();
//503
    case ServerUnavailableException():
      return ServerUnavailableFailure();
//500
    case InternalServerException():
      return InternalServerFailure();
  //400
    case BadRequestException():
      return BadRequestFailure();

  //409
    case ConflictException():
      return ConflictFailure();

    case SomethingWentWrongException():
      return SomethingWentWrongFailure();

    case DataNotFoundException():
      return DataNotFoundFailure();

    case AuthAccountExistWithDifferentCredentialException():
      return AuthAccountExistWithDifferentCredentialFailure();
    case AuthInvalidCredentialException():
      return AuthInvalidCredentialFailure();
    case AuthInvalidVerificationCodeException():
      return AuthInvalidVerificationCodeFailure();
    case AuthOperationNotAllowedException():
      return AuthOperationNotAllowedFailure();
    case AuthInvalidVerificationIdException():
      return AuthInvalidVerificationIdFailure();
    case AuthUserDisabledException():
      return AuthUserDisabledFailure();
    case AuthUserNotFoundException():
      return AuthUserNotFoundFailure();
    case AuthWrongPasswordException():
      return AuthWrongPasswordFailure();
    case AuthEmailAlreadyInUseException():
      return AuthEmailAlreadyInUseFailure();
    case AuthWeakPasswordException():
      return WeakPasswordFailure();
    case ParseJsonException():
      return ParseJsonFailure();
    default:
      return UnknownFailure();
  }
}
