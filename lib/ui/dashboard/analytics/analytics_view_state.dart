part of 'analytics_view_cubit.dart';

class AnalyticsViewState extends Equatable {
  final int totalUsers;
  final Map<ExtUserType, int> analyticsMap;
  final bool isLoading;
  final String errorMessage;
  final DateTime? selectedDateTime;

  static const initState = AnalyticsViewState._();

  const AnalyticsViewState._({
    this.totalUsers = 0,
    this.analyticsMap = const {},
    this.errorMessage = '',
    this.isLoading = false,
    this.selectedDateTime,
  });

  @override
  List<Object?> get props => [
        totalUsers,
        analyticsMap,
        errorMessage,
        isLoading,
        selectedDateTime,
        totalUsers,
      ];

  AnalyticsViewState _copyWith({
    int? totalUsers,
    bool? isLoading,
    String? errorMessage,
    DateTime? selectedDateTime,
    Map<ExtUserType, int>? analyticsMap,
  }) =>
      AnalyticsViewState._(
          totalUsers: totalUsers ?? this.totalUsers,
          isLoading: isLoading ?? this.isLoading,
          errorMessage: errorMessage ?? this.errorMessage,
          selectedDateTime: selectedDateTime ?? this.selectedDateTime,
          analyticsMap: analyticsMap ?? this.analyticsMap);

  AnalyticsViewState _toLoading() => _copyWith(
        isLoading: true,
        errorMessage: '',
      );

  AnalyticsViewState _toError(String message) => _copyWith(
        isLoading: false,
        errorMessage: message,
      );
}
