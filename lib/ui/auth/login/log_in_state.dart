part of 'log_in_cubit.dart';


class LogInState extends Equatable {
  final String errorMessage;
  final bool isFinished;
  final bool isLoading;
  final String loadingMessage;

  static const initialState = LogInState._();

  const LogInState._({
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

  LogInState _copyWith({
    String? errorMessage,
    bool? isFinished,
    bool? isLoading,
    String? loadingMessage,
  }) => LogInState._(
    errorMessage: errorMessage ?? this.errorMessage,
    isFinished: isFinished ?? this.isFinished,
    isLoading: isLoading ?? this.isLoading,
    loadingMessage: loadingMessage ?? this.loadingMessage,
  );


  LogInState _toLoading(String message) => _copyWith(
    isLoading: true,
    loadingMessage: message,
    errorMessage: '',
    isFinished: false,
  );
  LogInState _toError({required String errorMessage}) => _copyWith(
      isLoading: false,
      errorMessage: errorMessage,
      loadingMessage: '',
      isFinished: true
  );
  LogInState _toSuccess({bool? finish}) => _copyWith(
      isLoading: false,
      errorMessage: '',
      isFinished: finish,
      loadingMessage: ''
  );

}
