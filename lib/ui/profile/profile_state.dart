part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final String emailId;
  final String fullName;
  final DateTime? joinedDate;
  final String contactNumber;
  final bool isLoading;
  final String errorMessage;
  final bool isSignOut;

  static const initialState = ProfileState._();

  const ProfileState._({
    this.emailId = '',
    this.contactNumber = '',
    this.fullName = '',
    this.joinedDate,
    this.isLoading = false,
    this.errorMessage = '',
    this.isSignOut = false,
  });

  @override
  List<Object?> get props => [
        emailId,
        fullName,
        joinedDate,
        contactNumber,
        isLoading,
        errorMessage,
        isSignOut,
      ];

  ProfileState _copyWith({
    String? emailId,
    String? contactNumber,
    String? fullName,
    DateTime? joinedDate,
    bool? isLoading,
    String? errorMessage,
    bool? isSignOut,
  }) =>
      ProfileState._(
        errorMessage: errorMessage ?? this.errorMessage,
        isLoading: isLoading ?? this.isLoading,
        emailId: emailId ?? this.emailId,
        fullName: fullName ?? this.fullName,
        contactNumber: contactNumber ?? this.contactNumber,
        joinedDate: joinedDate ?? this.joinedDate,
        isSignOut: isSignOut ?? this.isSignOut,
      );

  ProfileState _toLoading() => _copyWith(
        isLoading: true,
        errorMessage: '',
      );

  ProfileState _toError({required String errorMessage}) => _copyWith(
        isLoading: false,
        errorMessage: errorMessage,
        isSignOut: false,
      );

  ProfileState _toSuccess({
    required String emailId,
    required String contactNumber,
    required String fullName,
    required DateTime joinedDate,
  }) =>
      _copyWith(
        emailId: emailId,
        fullName: fullName,
        contactNumber: contactNumber,
        joinedDate: joinedDate,
        errorMessage: '',
        isLoading: false,
        isSignOut: false,
      );

  ProfileState _toSignOut() => _copyWith(isSignOut: true, isLoading: true);
}
