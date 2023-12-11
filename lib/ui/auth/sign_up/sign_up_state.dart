part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final String errorMessage;
  final bool isFinished;
  final bool isLoading;
  final String loadingMessage;

  static const initialState = SignUpState._();

  const SignUpState._({
    this.errorMessage = '',
    this.isFinished = false,
    this.isLoading = false,
    this.loadingMessage = '',
  });

  @override
  List<Object?> get props => [
    errorMessage,
    isFinished,
    isLoading,
    loadingMessage,
  ];

  SignUpState _copyWith({
    String? errorMessage,
    bool? isFinished,
    bool? isLoading,
    String? loadingMessage,
}) => SignUpState._(
    errorMessage: errorMessage ?? this.errorMessage,
    isFinished: isFinished ?? this.isFinished,
    isLoading: isLoading ?? this.isLoading,
    loadingMessage: loadingMessage ?? this.loadingMessage,
  );


  SignUpState _toLoading(String message) => _copyWith(
    isLoading: true,
    loadingMessage: message,
    errorMessage: '',
    isFinished: false,
  );
  SignUpState _toError({required String errorMessage}) => _copyWith(
    isLoading: false,
    errorMessage: errorMessage,
    loadingMessage: '',
    isFinished: true
  );
  SignUpState _toSuccess({bool? finish}) => _copyWith(
    isLoading: false,
    errorMessage: '',
    isFinished: finish,
    loadingMessage: ''
  );
}
