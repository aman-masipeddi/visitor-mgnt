part of 'initial_cubit.dart';

class InitScreenState extends Equatable {
  final String errorMessage;
  final bool isLoading;
  final String loadingMessage;
  final bool isSuccess;

  static const initialState = InitScreenState._();

  const InitScreenState._({
    this.isLoading = false,
    this.errorMessage = '',
    this.loadingMessage = '',
    this.isSuccess = false,
  });

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        loadingMessage,
        isSuccess,
      ];

  InitScreenState _copyWith({
    String? errorMessage,
    String? loadingMessage,
    bool? isLoading,
    bool? isSuccess,
  }) =>
      InitScreenState._(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        loadingMessage: loadingMessage ?? this.loadingMessage,
        isSuccess: isSuccess ?? this.isSuccess,
      );

  InitScreenState _toLoading(String message) => _copyWith(
        isLoading: true,
        loadingMessage: message,
        isSuccess: false,
        errorMessage: '',
      );

  InitScreenState _toError(String message) => _copyWith(
        isLoading: false,
        errorMessage: message,
      );

  InitScreenState _toSuccess() => _copyWith(
        isLoading: false,
        errorMessage: '',
        isSuccess: true,
      );
}
