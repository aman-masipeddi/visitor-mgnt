part of 'user_session_cubit.dart';

class UserSessionState extends Equatable {
  final bool isLoading;
  final bool isCheckedIn;
  final String fullName;
  final String emailId;
  final String conNumber;
  final DateTime? checkedInTime;
  final ExtUserType? extUserType;
  final String errorMessage;
  final String successMessage;

  static const initState = UserSessionState._();

  const UserSessionState._({
    this.isLoading = false,
    this.isCheckedIn = false,
    this.fullName = '',
    this.emailId = '',
    this.conNumber = '',
    this.extUserType,
    this.checkedInTime,
    this.errorMessage = '',
    this.successMessage = '',
  });

  @override
  List<Object?> get props => [
        isLoading,
        isCheckedIn,
        fullName,
        emailId,
        conNumber,
        extUserType,
        checkedInTime,
        errorMessage,
        successMessage,
      ];

  UserSessionState _copyWith({
    bool? isLoading,
    bool? isCheckedIn,
    String? fullName,
    String? emailId,
    String? conNumber,
    DateTime? checkedInTime,
    ExtUserType? extUserType,
    String? errorMessage,
    String? successMessage,
  }) =>
      UserSessionState._(
        isLoading: isLoading ?? this.isLoading,
        isCheckedIn: isCheckedIn ?? this.isCheckedIn,
        fullName: fullName ?? this.fullName,
        emailId: emailId ?? this.emailId,
        conNumber: conNumber ?? this.conNumber,
        checkedInTime: checkedInTime ?? this.checkedInTime,
        extUserType: extUserType ?? this.extUserType,
        errorMessage: errorMessage ?? this.errorMessage,
        successMessage: successMessage ?? this.successMessage,
      );

  UserSessionState _toLoading() => _copyWith(
        isLoading: true,
        errorMessage: '',
        successMessage: '',
      );

  UserSessionState _toSuccess(String message) => _copyWith(
        isLoading: false,
        successMessage: message,
        errorMessage: '',
      );

  UserSessionState _toError(String message) => _copyWith(
        isLoading: false,
        successMessage: '',
        errorMessage: message,
      );

  UserSessionState _toCheckedIn({
    required String fullName,
    required String emailId,
    required String conNumber,
    required DateTime checkedInTime,
    required ExtUserType extUserType,
  }) =>
      UserSessionState._(
        fullName: fullName,
        emailId: emailId,
        conNumber: conNumber,
        checkedInTime: checkedInTime,
        extUserType: extUserType,
        errorMessage: '',
        isLoading: false,
        isCheckedIn: true,
        successMessage: '',
      );
}
