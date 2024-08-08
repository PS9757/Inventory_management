


import 'package:task/core/constants/errors_constants.dart';

////////////////--------4XX ---------------//////////////////////

///400 [BadRequestException] is thrown when there's
/// no active internet connection
class BadRequestException implements Exception {}

//401 [UnAuthrizedException] is thrown when you are not authrized or permission denied
class UnAuthrizedException implements Exception {}

// 403 Forbidden
class ForbiddenException implements Exception {}

/// [NotFoundException] is thrown when API Endpoint
/// returns a 404 Not Found Status Code
class NotFoundException implements Exception {}

// 405 Method Not allowed  [mainly when Wrong GET , POST, PATCH , PUT ....] are used
class MethodNotAllowedException implements Exception {}

// 408 Request time out
class RequestTimeOutException implements Exception {}

/// returns when Data not Found
class DataNotFoundException implements Exception {}

/// [ServerUnavailableException] is thrown when API Endpoint
/// returns a 503 Server Unavailable Status Code
class ServerUnavailableException implements Exception {}

/// [ConflictException] is thrown when API Endpoint
/// returns a 409 Conflict Status Code
class ConflictException implements Exception {}

// 413 request entity TOO loarge
class RequestEntityTooLargeException implements Exception {}

//429 Too many request from user Side
class TooManyRequestException implements Exception {}

////////////////--------5XX ---------------//////////////////////

/// [InternalServerException] is thrown when API Endpoint
/// returns a 500 Internal Server Error Status Code
class InternalServerException implements Exception {}

/// [NotImplementedServerException] is thrown when API Endpoint
/// returns a 501 Not Implemented Status Code
class NotImplementedServerException implements Exception {}

// /// [ServerUnavailableException] is thrown when API Endpoint
// /// returns a 503 Server Unavailable Status Code
// class ServerUnavailableException implements Exception {}

/// [GatewayTimeOutException] is thrown when API Endpoint
/// returns a 504 Gateway Timeout: The server, while acting as a gateway or proxy
class GatewayTimeOutException implements Exception {}

/// [BadGatewayException] is thrown when API Endpoint
/// returns a 502 Bad Gateway: The server, while acting as a gateway or proxy
class BadGatewayException implements Exception {}

/// [CacheException] is thrown when there's
/// no Cache Found in the device
class CacheException implements Exception {}

/// [NoInternetConnectionException] is thrown when there's
/// no active internet connection
class NoInternetConnectionException implements Exception {}

/// [SomethingWentWrongException] is thrown when there's
///
class SomethingWentWrongException implements Exception {}

/// [AuthUserNotFoundException] is thrown when there's
/// no user found in the firebase user directory
class AuthUserNotFoundException implements Exception {}

// Inavlid Email in the Firebase
class AuthInvalidEmailException implements Exception {}

// Wrong Password in the Firebase
class AuthWrongPasswordException implements Exception {}

// user Disabled in the Firebase
class AuthUserDisabledException implements Exception {}

///    verification code of the credential is not valid in Phone .
class AuthInvalidVerificationCodeException implements Exception {}

///    verification ID of the credential is not valid.id.
class AuthInvalidVerificationIdException implements Exception {}

class AuthOperationNotAllowedException implements Exception {}

class AuthInvalidCredentialException implements Exception {}

class AuthAccountExistWithDifferentCredentialException implements Exception {}

class AuthEmailAlreadyInUseException implements Exception {}

class AuthWeakPasswordException implements Exception {}

class ParseJsonException implements Exception {}

class TypeErrorException implements Exception {}

Exception firebaseAuthExceptionFromCode(String code) {
  switch (code) {
    case ErrorConstants.accountExistsWithDifferentCredential:
      throw AuthAccountExistWithDifferentCredentialException();
    case ErrorConstants.invalidCredential:
      throw AuthInvalidCredentialException();
    case ErrorConstants.invalidEmail:
      throw AuthInvalidEmailException();
    case ErrorConstants.invalidVerificationCode:
      throw AuthInvalidVerificationCodeException();
    case ErrorConstants.invalidVerificationID:
      throw AuthInvalidVerificationIdException();
    case ErrorConstants.operationNotAllowed:
      throw AuthOperationNotAllowedException();

    case ErrorConstants.userDisabled:
      throw AuthUserDisabledException();
    case ErrorConstants.userNotFound:
      throw AuthUserNotFoundException();
    case ErrorConstants.wrongPassword:
      throw AuthWrongPasswordException();
    case ErrorConstants.emailAlreadyInUse:
      throw AuthEmailAlreadyInUseException();
    case ErrorConstants.weakPassword:
      throw AuthWeakPasswordException();

    default:
      throw Exception('Firebase Error : $code');
  }
}
